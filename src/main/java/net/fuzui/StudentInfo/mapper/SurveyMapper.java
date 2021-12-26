package net.fuzui.StudentInfo.mapper;

import net.fuzui.StudentInfo.pojo.Survey;

import java.util.List;
import java.util.Map;

public interface SurveyMapper {
    public int insertSurvey(Survey survey);

    public int updateSurvey(Survey survey);

    List<Survey> querySurveyByTname(String tname, String courseclass);
}
