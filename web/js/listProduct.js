var Router = {
    'filter': {
        query: '/gallery-ajax_get_goods.html'
    }
};
var Query = function(url, data, update, options) {
    var self = this;
    this.update = function(url, data, update, options) {
        if(typeof(update) == 'object') {
            update = Module.gallery.show;
        }
        options = Object.merge({
            url: url,
            link: 'ignore',
            update: update
        }, options || {});
        new Request.HTML(options).post(data);
    };
    this.filter = function(data, fn){
        var url = Router.filter.query;
// var mask = new Mask({
// width: '100%',
// height: '100%',
// 'class': 'mini-mask',
// 'html': '<span class="mask-loading"></span>',
// 'effect': false,
// position: true,
// pins: true
// });
// if(Browser.ie) {
// mask.element.setStyle('background-color', Browser.version == 9 ? 'rgba(255,255,255,0.1)' : '');
// }
        self.update(url,data,Module.gallery.show, {
            onRequest:function() {
// mask.show();
            },
            onSuccess:function(rs){
// mask.hide();
                new DataLazyLoad({img:'data-src', lazyDataType:'img',onAfter:function(img){
                    if(Browser.ie6) fixImageSize(img);
                }});
                setGridSize(Module.gallery.show.getElements('.gallery-grid .goods-item'), ['.goods-name', '.promotion-tags'], 4);
                updateNum();
                miniCart.init();
                fn&&fn(rs);
            }
        });
    };
    this.addtocart = function(url, data, target) {
        var form = $('_addtocart_submitform') || new Element('form#_addtocart_submitform',{
                action: url,
                method: 'post',
                target: target,
                style: 'display:none'
            }).inject(document.body);
        var formElements = Array.from(data).invoke('clone', false);
        form.empty().adopt(formElements).submit();
    };
};
Query = new Query;
Module = new Module('gallery', ['filter', {'selected': 'filter_selected'}, 'sortbar', 'show', 'compare']);
var hides = Module.elements('gallery.filter', '.hide');
Module.gallery.filter.addEvents({
    'click:relay(.action-cat-filter)': function(e) {
        Memory.clean('gallery.filter');
    },
    'click:relay(.action-select-filter)': function(e){
        var item = this.getParent('.filter-item');
        if(item.hasClass('active')) return;
        setCustom(item);
        setFilter(this, item);
        item.addClass('active');
        Query.filter(getData());
    },
    'click:relay(.action-select-unlimit)':function(e){
        var item = this.getParent('.filter-item');
        if(item.hasClass('active')) return;
        var actives = item.getParent().getElements('.active');
        var label = this.getParent('[data-label]').get('data-label');
        if(actives.length) {
            actives.removeClass('active');
        }
        try{
            Module.gallery.selected.getElement('[data-label='+label+']').destroy();
        }catch(e){}
        setCustom(item);
        item.addClass('active');
        Query.filter(getData());
    },
    'click:relay(.action-delete-filter)':function(e) {
        var isSelect = this.getParent('.filter-selected') ? '-selected' : '';
        var el = this.getParent('.filter'+isSelect+'-item');
        var id = el.get('data-fid');
        var els;
        var sel;
        if(isSelect) {
            sel = el;
            els = Module.gallery.filter.getElements('[data-fid='+id+']');
            el = els.length > 1 ? els[1] : Module.gallery.filter.getElement('[data-fid$=custom]');
        }
        else {
            sel = Module.gallery.selected.getElement('[data-fid='+id+']');
        }
        delFilter(el, sel);
        Query.filter(getData());
    },
    'click:relay(.action-unfold-entries)':function(e){
        e.preventDefault();
        this.getParent().getElement('.filter-item-hide').toggleClass('filter-item-show');
        toggleText(this.getElement('.text'));
        toggleText(this.getElement('.icon'));
    },
    'focus:relay(.action-filter-input)':function(e){
        var parent = this.getParent('.filter-item');
        clearTimeout(parent.timer);
        parent.addClass('filter-pop-active');
        if(!parent.outerclick) parent.getDocument().addEvent('click', function(e){
            parent.outerclick = true;
            if(!parent.contains($(e.target))) hideFilterPop(parent);
        });
    },
    'mouseenter:relay(.filter-pop-active)':function(e){
        clearTimeout(this.timer);
    },
    'mouseleave:relay(.filter-pop-active)':function(e){
        this.timer = hideFilterPop.delay(2000, this,this);
    },
    'click:relay(.action-reset-price)':function(e){
        e.preventDefault();
        this.getParent('.filter-item').getElements('.action-filter-input').set('value', '')[0].focus();
    },
    'inputchange:relay(.action-filter-input)': function(){
        if(!this.value.test(/^(0|[1-9][0-9]*)?$/)) {
            this.value = this.value.substr(0, this.value.length - 1);
        }
    },
    'click:relay(.action-confirm-price)':function(e){
        var parent = this.getParent('.filter-item');
        var input = parent.getElements('.action-filter-input');
        var min = input[0].value;
        var max = input[1].value;
        if(min == max) return;
        if(min == '') min = 0;
        if(max == '') max = 99999999;
        if(isNaN(min) || isNaN(max)) return;
        if(min - max > 0) {
            var tmp = min;
            min = max;
            max = tmp;
        }
        min = +min;
        max = +max;
        var value = min;
        if(max == 99999999) value += '元以上';
        else value += '-' + max + '元';
        input[0].value = min;
        input[1].value = max;
        setFilter(this, parent, value, min, max);
        hideFilterPop(this.getParent('.filter-item'));
        Query.filter(getData());
    },
    'click:relay(.filter-dropdown-label)':function(e) {
        var parent = this.getParent();
        parent.toggleClass('current');
        if(!parent.outerclick) parent.getDocument().addEvent('click', function(e){
            parent.outerclick = true;
            if(!parent.contains($(e.target))) hideDropdown(parent);
        });
    },
    'mouseenter:relay(.filter-dropdown-item)':function(e){
        clearTimeout(this.timer);
    },
    'mouseleave:relay(.filter-dropdown-item)':function(e){
        this.timer = hideDropdown.delay(1000, this, this);
    },
    'click:relay(.action-filter-more)':function(e) {
        e.preventDefault();
        hides.toggleClass('hide');
        toggleText(this.getElement('.text'));
        toggleText(this.getElement('.icon'));
    }
});
Module.gallery.sortbar.addEvents({
    'click:relay(.action-sort)':function(e){
        e.preventDefault();
        toggleOrderby(this);
        if(!this.hasClass('active') || this.match('[class*=price-]')) {
            Query.filter(getData());
        }
        toggleActive(this);
    },
    'change:relay(.action-orderby)':function(e) {
        var sort = Module.elements('gallery.sortbar','.action-sort');
        var hl = sort.every(function(s){
            var sortby = s.get('data-sort');
            var order = this.value;
            if(order.indexOf('price ') === 0 && sortby.indexOf('price ') === 0) {
                if(order !== sortby) {
                    toggleOrderby(s, false);
                }
                toggleActive(s);
                return false;
            }
            if(order == sortby) {
                toggleActive(s);
                return false;
            }
            return true;
        }, this);
        if(hl) sort.removeClass('active');
        Query.filter(getData());
    },
    'click:relay(.action-showmode)':function(e){
        e.preventDefault();
        if(this.hasClass('active')) return;
        toggleActive(this);
        Module.element('gallery.sortbar','input[name=showtype]').value = this.get('data-show-type');
        Query.filter(getData());
    },
    'change:relay(.action-gtags,.action-available)':function(e) {
        Query.filter(getData());
    },
    'click:relay(a.flip:not(.over))':function(e){
        e.preventDefault();
        var self = this;
        Query.filter(getData(this), function(e){
            self.getSiblings('.over').removeClass('over');
            var page = getFlipPage();
            var parent = self.getParent();
            if(page <= 1) parent.getElement('.prev').addClass('over');
            else if(page >= getPage().total) parent.getElement('.next').addClass('over');
        });
    }
});
Module.gallery.show.addEvents({
    'click:relay(.action-addtocart)':function(e){
        if(this.target != '_dialog_minicart') {
            var item = this.getParent('.goods-item');
            var num = item.getElement('.action-quantity-input');
            if(!num) return;
            var ginfo = {
                gid: item.getElement('[name="goods[goods_id]"]').value,
                pid: item.getElement('[name="goods[product_id]"]').value,
                num: num.value
            }
            var url = '/cart-add-goods-{gid}-{pid}-{num}.html';
            this.href = url.substitute(ginfo);
// Query.addtocart(this.href, data, this.target);
        }
    },
    'click:relay(.action-notify)': function(e) {
        var id = this.get('rel').split('::');
        var dialog = new Dialog($('product_notify').wrapped(), {
            title:'到货通知',
            width: 400,
            modal: {
                'class': 'cover'
            },
            onLoad: function(){
                var content = this.content;
                var holder = content.getElements('input[type=hidden]');
                var handle = content.getElement('[rel=_request]');
                holder[0].value = id[0];
                holder[1].value = id[1];
                handle && handle.store('_ajax_config',{
                    onSuccess:function(rs){
                        if(rs && rs[0]) {
                            if(rs[0]['true']) {
                                content.getElement('.product-notify').innerHTML = '<div class="success">联系方式已经成功提交，到货后会立刻通知您。</div>';
                                dialog.hide.delay(3000, dialog);
                            }
                        }
                    }
                });
            }
        });
    },
    'click:relay(.action-compare)': function(e) {
        var container = Module.gallery.compare;
        var content = container.getElement('.content');
        var ul = content.getElement('ul');
        var cpr = container.getElement('.compare-template').innerHTML;
        var info = JSON.decode(this.get('data-compare'));
        var html = cpr.substitute(info);
        var tips = new Tips(this);
        var last;
        if(!ul){
            content.innerHTML = '<ul>' + html + '</ul>';
            showCompareFoot();
            last = content.getElement('.compare-item');
        }
        else {
            var items = ul.getElements('.compare-item');
            var j = items.length;
            if(j == 5) {
                return tips.show('最多只能对比5个商品，请删除之后再添加。');
            }
            for(var i = 0; i < j; i ++){
                var item = items[i];
                var rs = JSON.decode(item.get('data-compare'));
                var type_id = item.getElement('input[name=type_id]').value;
                var goods_id = item.getElement('input[name^=goods_id]').value;
                if(info.type_id != type_id) {
                    return tips.show('只能对比同类商品！');
                }
                if(info.goods_id == goods_id) {
                    return tips.show('该商品已加入对比栏。');
                }
            }
            tips.hide();
            last = new Element('ul', {html: html}).getFirst().inject(ul);
        }
        clearTimeout(container.timer);
        openCompare(container);
        if(Browser.ie6) {
            last.getElement('.action-goods-img').zoomImg(60, 60);
        }
        this.addClass('stat-compared');
        foldCompare(container, 3000);
    },
    'click:relay(a.flip:not(.over))':function(e){
        e.preventDefault();
        Query.filter(getData(this), function(e){
            try{
                new Fx.Scroll(document.body, {link:'cancel', duration: 0}).toElementEdge(Module.gallery.sortbar);
            }catch(e){}
        });
    }
});
Module.gallery.compare.addEvents({
    'click:relay(.action-unfold-compare)': function(e) {
        openCompare();
    },
    'click:relay(.action-fold-compare)': function(e) {
        foldCompare();
    },
    'click:relay(.action-del-compare)': function(e) {
        e.preventDefault();
        var ul = this.getParent('ul');
        if(ul.getChildren().length > 1) {
            this.getParent('.compare-item').destroy();
        }
        else clearCompare();
    },
    'click:relay(.action-goods-compare)':function(e){
        var item = Module.gallery.compare.getElements('.compare-item');
        if(item.length < 2) {
            e.stop();
            var tips = new Tips(this);
            return tips.show('对比最少需要有2件商品');
        }
        /*
         var data = Module.gallery.compare.getElements("[data-compare]").get("data-compare");
         var rs = {goods_id:[]};
         data.length && data.each(function(d,i){
         rs.goods_id[i] = JSON.decode(d).goods_id;
         });
         Object.toQueryString(rs);
         */
    },
    'click:relay(.action-clear-compare)': function(e) {
        e.preventDefault();
        clearCompare();
    },
    'mouseleave': function(e) {
        foldCompare(this, 3000);
    }
});
function getData(el) {
    var cat = 'cat_id=22';
    var vcat = 'virtual_cat_id=';
    var filter= [cat,vcat];
    var param = location.search;
    if(param) {
        param = param.split('?')[1];
        filter.push(param);
    }
    var page;
    if(el) page = 'page=' + getFlipPage(el);
    var data = filter.concat(Array.from(Module.gallery.selected.getElements('[data-fid]').get('data-fid')), decodeURI(Module.gallery.sortbar.toQueryString()), page);
    data = data.join('&').replace(/-/g, '[]=');
    data && Memory.set('gallery.filter', data);
    return data;
}
//延迟加载图片
new DataLazyLoad({
    img:'data-src',
    lazyDataType:'img',
    onAfter:function(img){
//ie6下缩放图片
        if(Browser.ie6) {
            fixImageSize(img);
        }
    }
});
//商品列表固定4列计算每列宽度并处理列高
setGridSize(Module.gallery.show.getElements('.gallery-grid .goods-item'), ['.goods-name', '.promotion-tags'], 4);
if(Browser.ie6) {
//ie6下对比栏fixed
    Module.gallery.compare.fixed('top');
}
function delFilter(el,sel) {
    var items = sel.getSiblings();
    if(items.length == 1) {
        if(el) {
            var parent = el.getParent();
            if(parent.hasClass('filter-item-hide')) parent = parent.getParent();
            parent.getElement('.filter-item').addClass('active');
        }
        items.getParent().destroy();
    }
    else sel.destroy();
    var input = el.getElements('.action-filter-input');
    if(input.length) {
        input.each(function(el){
            el.value = '';
        });
    }
    el && el.removeClass('active');
}
function setFilter(el, item, value, min, max) {
    value = value || el.get('text');
    item = item || el.getParent('.filter-item');
    var type = el.getParent('.filter-lists-container') ? '-entries' : el.getParent('.filter-promotion') ? '-promotion' : '-dropdown';
    var id = item.get('data-fid');
    var entries = el.getParent('[data-label]');
    var first = entries.getElement('.filter-item');
    var label = entries.get('data-label');
    var single = entries.get('data-single');
    var name = entries.getElement('.filter'+type+'-label').get('text');
    name = name.substr(0, name.length - 1) + '：';
    var tpl = value + '<a href="javascript:void(0);" class="action-delete-filter icon">×</a>';
    var selected = Module.gallery.selected.getElement('.filter-selected-values');
    var selected_item = selected.getElement('[data-label="'+label+'"]');
    single = single ? ' data-single="true"' : '';
    if(first.hasClass('active')) first.removeClass('active');
    if(single) item.getParent().getElements('.active').removeClass('active');
    if(!id || id.test(/custom/) && (min || min === 0) && max) {
        id = label + '-' + min + '~' + max;
    }
    if(!selected_item) {
        tpl = '<span class="filter-selected-entries" data-label="'+label+'"'+single+'><label class="filter-selected-label">'+name+'</label><span class="filter-selected-item" data-fid="'+id+'">'+tpl+'</span></span>';
        new Element('div',{html:tpl}).getFirst().inject(selected);
    }
    else {
        if(single) {
            selected_item.getElement('.filter-selected-item').set('data-fid', id).innerHTML = tpl;
        }
        else {
            new Element('span.filter-selected-item', {
                'data-fid': id,
                html:tpl
            }).inject(selected_item);
        }
    }
}
function setCustom(item) {
    var price = item.getNext('[data-fid$=custom]');
    if(price) {
        var area = item.get('data-fid');
        var input = price.getElements('.action-filter-input');
        area = area ? area.split('-')[1].split('~') : [];
        input.each(function(el,i){
            el.value = area[i] || '';
        });
    }
}
function getFlipPage(el) {
    var page = getPage().current;
    if(el) {
        if(el.hasClass('next')) page += 1;
        else if(el.hasClass('prev')) page -= 1;
        else page = el.get('text');
    }
    return page;
}
function getPage() {
    var pagedata = {};
    var pagelimit = '8';
    try {
        pagedata = JSON.decode(Module.gallery.show.getElement('.action-pagedata').value) || {};
    }catch(e){}
    return {
        sum: pagedata.total || 0,
        current: pagedata.pagecurrent || 1,
        total: pagedata.pagetotal || 1
    };
}
function updateNum() {
    var page = getPage();
    $('filter_container').getElement('.op-search-result').innerHTML = page.sum;
    Module.element('gallery.sortbar', '.page-current').innerHTML = page.current;
    Module.element('gallery.sortbar', '.page-total').innerHTML = page.total;
    var prev = Module.element('gallery.sortbar', '.page-action .prev');
    var next = Module.element('gallery.sortbar', '.page-action .next');
    if(page.total == 1) {
        prev.addClass('over');
        next.addClass('over');
    }
    else if(page.total > 1){
        next.removeClass('over');
        if(page.total == page.current) {
            prev.removeClass('over');
            next.addClass('over');
        }
        else {
            if(page.current == 1) {
                prev.addClass('over');
            }
            else {
                prev.removeClass('over');
            }
            next.removeClass('over');
        }
    }
}
function hideFilterPop(el) {
    if(!el.getElement('input:focus')){
        el.removeClass('filter-pop-active');
    }
}
function hideDropdown(el) {
    el.removeClass('current');
}
function toggleText(el, attr) {
    attr = attr || 'data-toggle';
    var a = el.get(attr);
    var b = el.get('text');
    el.set(attr, b).set('text', a);
}
function toggleActive(el, cls) {
    if(!el) return;
    cls = cls || 'active';
    el.addClass(cls).getSiblings('.'+cls).removeClass(cls);
}
function toggleOrderby(el, set){
// if(el.hasClass('active')) return;
    var sel = Module.element('gallery.sortbar', '.action-orderby');
    var sort = '';
    if(el.hasClass('price-desc')) {
        el.swapClass('price-desc', 'price-asc');
        sort = 'price asc';
        el.set('data-sort', sort);
    }
    else if(el.hasClass('price-asc')) {
        el.swapClass('price-asc', 'price-desc');
        sort = 'price desc';
        el.set('data-sort', sort);
    }
    else {
        sort = el.get('data-sort');
    }
    if(set !== false) sel.value = sort;
}
//== 为数量选择框绑定事件
bindQuantityEvent(Module.gallery.show,setQuantity);
function bindQuantityEvent(elements, callback) {
    elements = document.id(elements) || $$(elements);
    if(!elements && !elements.length) return;
    var value = '';
    elements.addEvents({
//= 数量按钮
        'click:relay(.btn-decrease,.btn-increase)': function(e) {
            var input = this.getParent().getElement('.action-quantity-input');
            value = +input.value;
            input.value = this.hasClass('btn-decrease') ? value - 1 : value + 1;
            callback && callback(input, value);
        },
//= 数量输入框
        'focus:relay(.action-quantity-input)': function(e){
            value = +this.value;
        },
        'change:relay(.action-quantity-input)': function(e) {
            callback && callback(this, value);
        }
    });
}
//== 获取商品数量值
function getQuantity(el, type) {
    return el.getElement('input[name=' + type + ']').value;
}
//== 设置商品数量
function setQuantity(input, value) {
    var type = 'product';
    inputCheck(input, {min: input.get('min'), max: input.get('max'), 'default': value});
}
//== 商品数量输入框正确性检测
function inputCheck(input, options) {
    if(!input) return false;
    options = options || {};
    if(isNaN(options.min)) options.min = 1;
    if(isNaN(options.max)) options.max = 9999;
    options['default'] = options['default'] || options.min;
    var value = +input.value;
    var tips = new Tips(input);
    var pre = '';
    var msg = '';
    if(options.store && options.store - value <= 0) {
        pre = '库存有限，';
    }
    if(value < options.min) {
        input.value = options.min;
        msg = '此商品的最小购买数量为' + options.min + '件';
    }
    else if(value > options.max){
        input.value = options.max;
        msg = pre + '此商品最多只能购买' + options.max + '件';
    }
    else if(isNaN(value)) {
        input.value = options['default'];
        msg = '只允许输入数字';
    }
    if (msg) {
        tips.show(msg);
        return false;
    }
    tips.hide();
    return true;
}

