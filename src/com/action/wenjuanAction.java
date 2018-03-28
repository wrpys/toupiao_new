package com.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.TAnswerDAO;
import com.dao.TSubjectDAO;
import com.dao.TToupiaoDAO;
import com.dao.TToupiaoxuanxiangDAO;
import com.dao.TWenjuanDAO;
import com.model.TAnswer;
import com.model.TSubject;
import com.model.TToupiao;
import com.model.TWenjuan;
import com.opensymphony.xwork2.ActionSupport;

public class wenjuanAction extends ActionSupport {
	private String id;
	private String mingcheng;
	private Integer mingchengType;

	private String message;
	private String path;

	private TWenjuanDAO wenjuanDAO;
	private TToupiaoDAO toupiaoDAO;
	private TToupiaoxuanxiangDAO toupiaoxuanxiangDAO;
	
	//czx add
	private TSubjectDAO subjectDAO;
	private TAnswerDAO  answerDAO;
	
	public String wenjuanAdd() {
		TWenjuan wenjuan = new TWenjuan();

		wenjuan.setId(String.valueOf(new Date().getTime()));
		wenjuan.setMingcheng(mingcheng);
		wenjuan.setMingchengType(mingchengType);
		wenjuan.setShijian(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

		wenjuanDAO.save(wenjuan);
		this.setMessage("添加完毕");
		this.setPath("wenjuanMana.action");
		return "succeed";
	}

	public String wenjuanMana() {
		String sql = "from TWenjuan";
		List wenjuanList = wenjuanDAO.getHibernateTemplate().find(sql);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("wenjuanList", wenjuanList);
		return ActionSupport.SUCCESS;
	}

	public String wenjuanDel() {
		TWenjuan wenjuan = wenjuanDAO.findById(id);
		wenjuanDAO.delete(wenjuan);
		this.setMessage("删除完毕");
		this.setPath("wenjuanMana.action");
		return "succeed";
	}

	public String wenjuan_search() {
		String sql = "from TWenjuan where mingcheng like '%" + mingcheng.trim() + "%'";
		List wenjuanList = wenjuanDAO.getHibernateTemplate().find(sql);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("wenjuanList", wenjuanList);
		return ActionSupport.SUCCESS;
	}

	public String wenjuanDetailQian() {
		TWenjuan wenjuan = wenjuanDAO.findById(id);

		String sql = "from TToupiao where wenjuan_id=" + wenjuan.getId();
		List toupiaoList = toupiaoDAO.getHibernateTemplate().find(sql);
		for (int i = 0; i < toupiaoList.size(); i++) {
			TToupiao toupiao = (TToupiao) toupiaoList.get(i);
			String sql11 = "from TToupiaoxuanxiang where toupiao_id=" + toupiao.getId();
			List xuanxiangList = toupiaoxuanxiangDAO.getHibernateTemplate().find(sql11);
			toupiao.setXuanxiangList(xuanxiangList);
		}

		wenjuan.setToupiaoList(toupiaoList);
		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("wenjuan", wenjuan);
		request.put("id", id);

		return ActionSupport.SUCCESS;

	}

	public String wenjuan_canyu() {
		HttpServletRequest request = ServletActionContext.getRequest();

		String xxxxx = request.getParameter("xxxxx");
		System.out.println(xxxxx + "^^^^");

		String[] s = xxxxx.split(",");
		for (int i = 0; i < s.length; i++) {
			String xuanxiang_id = request.getParameter(s[i]);
			String sql = "update TToupiaoxuanxiang set piaoshu=piaoshu+1 where id=" + xuanxiang_id;
			toupiaoxuanxiangDAO.getHibernateTemplate().bulkUpdate(sql);
		}

		request.setAttribute("msg", "非常感谢您的参与");
		return "msg";
	}

	public String wenjuan_jieguo() {
		TWenjuan wenjuan = wenjuanDAO.findById(id);

		String sql = "from TToupiao where wenjuan_id=" + wenjuan.getId();
		List toupiaoList = toupiaoDAO.getHibernateTemplate().find(sql);
		for (int i = 0; i < toupiaoList.size(); i++) {
			TToupiao toupiao = (TToupiao) toupiaoList.get(i);
			String sql11 = "from TToupiaoxuanxiang where toupiao_id=" + toupiao.getId();
			List xuanxiangList = toupiaoxuanxiangDAO.getHibernateTemplate().find(sql11);
			toupiao.setXuanxiangList(xuanxiangList);
		}

		wenjuan.setToupiaoList(toupiaoList);

		Map request = (Map) ServletActionContext.getContext().get("request");
		request.put("wenjuan", wenjuan);
		return ActionSupport.SUCCESS;
	}
	
	
	
	/**
	 * 根据问卷ID获取所有的题目
	 * @author CZX
	 * @return
	 */
	public String getAllSubjects() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String wenjuanId = request.getParameter("wenjuan_id");//问卷信息ID
		String sql = "from TSubject where wenjuan_id=" + wenjuanId + " order by subject_id ASC";
		List<TSubject> subjectList = subjectDAO.getHibernateTemplate().find(sql);
		Map<String,Object> request2 = (Map) ServletActionContext.getContext().get("request");
		if (subjectList == null) {
			subjectList = new ArrayList<TSubject>();
		}
		request2.put("subjectList", subjectList);
		return ActionSupport.SUCCESS;
	}
	
	/**
	 * 展示此问卷信息的第一道题目，不管做任何回答，都跳转至下一道题目
	 * @author CZX
	 * @return
	 */
	public String getTimuByWenjuanId1() {
		HttpServletRequest request = ServletActionContext.getRequest();
		//String 此次问卷ID = request.getParameter("此次问卷ID");//此次问卷ID
		String wenjuanId = request.getParameter("wenjuan_id");//问卷信息ID
		String subjectId = request.getParameter("subject_id");//題目ID,便于获取下一道题目
		String sql = "";
		if("".equals(subjectId) || null==subjectId) {
			sql = "from TSubject where wenjuanId=" + wenjuanId + " order by subjectId ASC";
		}else {
			sql = "from TSubject where wenjuanId=" + wenjuanId + " and subjectId>" + subjectId + " order by subject_id ASC";
		}
		List<TSubject> subjectList = subjectDAO.page(sql, 0, 1);
		if(subjectList != null && subjectList.size() > 0) {
			request.setAttribute("subject", subjectList.get(0));
			List<TAnswer> answers = answerDAO.getHibernateTemplate().find("from TAnswer where subjectId=" + subjectList.get(0).getSubjectId());
			request.setAttribute("answers", answers);
		} else {
			request.setAttribute("subject", null);
		}
		return ActionSupport.SUCCESS;
	}

	
	/**
	 * 
	 * 展示此问卷信息的第一道题目，根据所选选项进行跳转到对应题目，直至遇到文本域题目或者答案没有设置跳转的题目
	 *@author CZX 
	 * @throws Exception 
	 */
	public String getTimuByWenjuanIdOne2() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		//String 此次问卷ID = request.getParameter("此次问卷ID");//此次问卷ID
		String wenjuanId = request.getParameter("wenjuan_id");//问卷信息ID
		String subjectId = request.getParameter("subject_id");//題目ID,便于获取下一道题目
		String answerContent = request.getParameter("answer_content");//題目答案內容,根据所选选项进行跳转到对应题目
		String subjectSql = "from TSubject where wenjuan_id=" + wenjuanId + " order by subject_id ASC";
		List<TSubject> subjectList = subjectDAO.getHibernateTemplate().find(subjectSql);
		Map<String,Object> response = (Map) ServletActionContext.getContext().get("request");
		if("".equals(subjectId) || null==subjectId) {//first time 
			response.put("subject", subjectList.get(0));
			//return ActionSupport.SUCCESS;
		}else if(null !=answerContent && !"".equals(answerContent)){//the second time with the answer
			String answerSql = "from TAnswer where answer_content='" + answerContent + "' and subject_id=" + subjectId;
			List<TAnswer> answerList = answerDAO.getHibernateTemplate().find(answerSql);
			if(answerList.size() !=1) {
				throw new Exception("本题答案对应题目异常,请联系管理员!");
			}
			TAnswer answer = answerList.get(0);
			Integer subjectRelId = answer.getSubjectRelId();
			TSubject subject = subjectDAO.findById(subjectRelId.longValue());
			response.put("subject", subject);
		}
		request.setAttribute("msg", "getTimuByWenjuanIdOne2题目获取成功!");
		return "msg";
		//return ActionSupport.SUCCESS;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMingcheng() {
		return mingcheng;
	}

	public void setMingcheng(String mingcheng) {
		this.mingcheng = mingcheng;
	}

	public Integer getMingchengType() {
		return mingchengType;
	}

	public void setMingchengType(Integer mingchengType) {
		this.mingchengType = mingchengType;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public TWenjuanDAO getWenjuanDAO() {
		return wenjuanDAO;
	}

	public void setWenjuanDAO(TWenjuanDAO wenjuanDAO) {
		this.wenjuanDAO = wenjuanDAO;
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

}
