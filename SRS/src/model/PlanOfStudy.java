package model;

import java.util.ArrayList;
import java.util.List;

import service.PlanService;


public class PlanOfStudy {

	private Student studentOwner;
	private List<Course> courses;


	public List<Course> diplay() {
		PlanService service = new PlanService();
		List<Course> list = new ArrayList<Course>();
		list = service.getCourses(studentOwner.getSsn());
		return list;
	}

	public PlanOfStudy() {
		courses = new ArrayList<Course>();
	}

	public Student getStudentOwner() {
		return studentOwner;
	}

	public void setStudentOwner(Student studentOwner) {
		this.studentOwner = studentOwner;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

}
