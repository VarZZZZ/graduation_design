package service;

import entity.Evaluation;

import java.util.List;

/**
 * Created by Liangying on 2017/11/20.
 */
public interface EvaluationService {
    int add(Evaluation evaluation);
    int cudAdd(Evaluation evaluation);
    int delete(String id);
    int update(Evaluation evaluation);
    Evaluation get(String id);
    List<Evaluation> list();
}
