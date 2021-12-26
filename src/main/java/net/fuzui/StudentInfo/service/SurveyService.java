package net.fuzui.StudentInfo.service;
import net.fuzui.StudentInfo.pojo.Survey;

import java.util.List;

import net.fuzui.StudentInfo.pojo.Survey;

public interface SurveyService {
    public int insertSurvey(Survey survey);

    public int updateSurvey(Survey survey);

    List<Survey> querySurveyByTname(String tname, String courseclass);
}
