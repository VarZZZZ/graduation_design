package dao;

import entity.Evaluation;

import java.util.List;

/**
 * Created by Liangying on 2017/11/20.
 */
public interface EvaluationMapper {
    public int add(Evaluation evaluation);
    public int delete(String id);
    public Evaluation get(String id);
    public int update(Evaluation evaluation);
    public List<Evaluation> list();
}
