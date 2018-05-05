<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal fade" id="myModalInfo" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-title-background">
                <h6 class="modal-title" id="myModalLabel">
                    	<img src="images/info.png" />
                    	提示对话框
                </h6>
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <div class="modal-body">
            	
                <b><label id="Info"></label></b>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default ButtonClose"
                        data-dismiss="modal">
                    	关闭
                </button>
            </div>
        </div>
    </div>
</div>    
