package net.fuzui.StudentInfo.service.impl;

import net.fuzui.StudentInfo.mapper.SurveyMapper;
import net.fuzui.StudentInfo.pojo.Survey;
import net.fuzui.StudentInfo.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private SurveyMapper surveyMapper;
	
	@Override
	public int insertSurvey(Survey survey) {
		return surveyMapper.insertSurvey(survey);
	}

	@Override
	public int updateSurvey(Survey survey) {
		return surveyMapper.updateSurvey(survey);
	}

	public List<Survey> querySurveyByTname(String tname, String courseclass){
		tname = "%" + tname + "%";
		return surveyMapper.querySurveyByTname(tname, courseclass);
	}
}
