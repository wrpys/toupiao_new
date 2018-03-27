package com.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.dao.TAnswerDAO;
import com.dao.TSubjectDAO;
import com.dao.TToupiaoDAO;
import com.dao.TToupiaoxuanxiangDAO;
import com.model.TAnswer;
import com.model.TSubject;
import com.model.TToupiao;
import com.model.TToupiaoxuanxiang;
import com.opensymphony.xwork2.ActionSupport;

public class toupiaoAction extends ActionSupport {

	private static final long serialVersionUID = -4225143477547173182L;
	
	private ArrayList<String> answers;//��ѡ���ѡ�Ĵ��б��ı���Ļ�����ֻ��һ����¼
	
	private TToupiaoDAO toupiaoDAO;
	private TToupiaoxuanxiangDAO toupiaoxuanxiangDAO;
	
	private TSubjectDAO subjectDAO;
	private TAnswerDAO answerDAO;

	public String toupiaoAdd() {
		HttpServletRequest request = ServletActionContext.getRequest();

		String id = String.valueOf(new Date().getTime());
		String title = request.getParameter("title");
		String wenjuan_id = request.getParameter("wenjuan_id");
		TToupiao toupiao = new TToupiao();

		toupiao.setId(id);
		toupiao.setTitle(title);
		toupiao.setWenjuan_id(wenjuan_id);

		toupiaoDAO.save(toupiao);

		String[] xuanxiangneirong = request.getParameterValues("xuanxiangneirong");
		for (int i = 0; i < xuanxiangneirong.length; i++) {
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			System.out.println(xuanxiangneirong[i] + "%%");
			toupiaoxuanxiangSave(xuanxiangneirong[i], id);// ����ط���id��ͶƱ��id
		}

		request.setAttribute("msg", "������");
		return "msg";
	}
	
	/**
	 * ͶƱ-˳�������Ŀ
	 * @author CZX
	 * @return
	 * @throws Exception 
	 */
	public String toupiaoShunxuAdd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wenjuanId = request.getParameter("wenjuan_id");//�ʾ���ϢID
		String subjectTitle = request.getParameter("subject_type");//��Ŀ����
		int subjectType = Integer.parseInt(request.getParameter("subject_type"));//����ѡ����ѡ���ı���
		TSubject subject = new TSubject();
		subject.setSubjectTitle(subjectTitle);
		subject.setSubjectType(subjectType);
		subject.setWenjuanId(wenjuanId);
		TSubject result  =subjectDAO.saveRe(subject);
		Long subjectId = result.getSubjectId();//save subject and in order to get the id
		for (String answerContent : answers) {
			TAnswer answer = new TAnswer();
			answer.setAnswerContent(answerContent);
			answer.setSubjectId(subjectId);
			answerDAO.save(answer);
		}
		request.setAttribute("msg", "˳�������Ŀ���");
		return "msg";
	}
	
	/**
	 * �����ת��Ŀʱ���𰸿���ѡ���Ӧ��ת����Ŀ�������򣬱���г����ʾ��������Ŀ��
	 * @author CZX
	 * @return
	 */
	public String toupiaoTiaozhuanAdd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wenjuanId = request.getParameter("wenjuan_id");//�ʾ���ϢID
		String subjectTitle = request.getParameter("subject_type");//��Ŀ����
		int subjectType = Integer.parseInt(request.getParameter("subject_type"));//����ѡ����ѡ���ı���
		TSubject subject = new TSubject();
		subject.setSubjectTitle(subjectTitle);
		subject.setSubjectType(subjectType);
		subject.setWenjuanId(wenjuanId);
		TSubject result  =subjectDAO.saveRe(subject);
		Long subjectId = result.getSubjectId();//save subject and in order to get the id
		//{answer_content:��,subject_rel_id:������Ŀ},{answer_content:��2,subject_rel_id:������Ŀ2}
		for (String answerContent : answers) {
			TAnswer answer = new TAnswer();
			answer.setAnswerContent((answerContent.split(",")[0]).split(":")[1]);
			answer.setSubjectId(subjectId);
			answer.setSubjectRelId(Integer.parseInt((answerContent.split(",")[1]).split(":")[1]));
			answerDAO.save(answer);
		}
		request.setAttribute("msg", "�����ת��Ŀ���");
		return "msg";
	}
	

	public void toupiaoxuanxiangSave(String xuanxiangneirong, String toupiao_id) {
		TToupiaoxuanxiang toupiaoxuanxiang = new TToupiaoxuanxiang();

		toupiaoxuanxiang.setId(String.valueOf(new Date().getTime()));
		toupiaoxuanxiang.setXuanxiangneirong(xuanxiangneirong);
		toupiaoxuanxiang.setPiaoshu(0);
		toupiaoxuanxiang.setToupiao_id(toupiao_id);

		toupiaoxuanxiangDAO.save(toupiaoxuanxiang);
	}

	public String toupiao_zhutu() {
		HttpServletRequest request = ServletActionContext.getRequest();

		String toupiao_id = request.getParameter("toupiao_id");

		String sql = "from TToupiaoxuanxiang where toupiao_id=?";
		Object[] c = { toupiao_id };
		List xuanxiangList = toupiaoxuanxiangDAO.getHibernateTemplate().find(sql, c);

		request.setAttribute("xuanxiangList", xuanxiangList);
		return ActionSupport.SUCCESS;
	}

	public TToupiaoDAO getToupiaoDAO() {
		return toupiaoDAO;
	}

	public void setToupiaoDAO(TToupiaoDAO toupiaoDAO) {
		this.toupiaoDAO = toupiaoDAO;
	}

	public TToupiaoxuanxiangDAO getToupiaoxuanxiangDAO() {
		return toupiaoxuanxiangDAO;
	}

	public void setToupiaoxuanxiangDAO(TToupiaoxuanxiangDAO toupiaoxuanxiangDAO) {
		this.toupiaoxuanxiangDAO = toupiaoxuanxiangDAO;
	}
	
	public TSubjectDAO getSubjectDAO() {
		return subjectDAO;
	}

	public void setSubjectDAO(TSubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}

	public TAnswerDAO getAnswerDAO() {
		return answerDAO;
	}

	public void setAnswerDAO(TAnswerDAO answerDAO) {
		this.answerDAO = answerDAO;
	}

	public ArrayList<String> getAnswers() {
		return answers;
	}


	public void setAnswers(ArrayList<String> answers) {
		this.answers = answers;
	}

}
