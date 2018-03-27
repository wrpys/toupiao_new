package com.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TSubject;

/**
 * TSubjectDAO
 * 
 * @author CZX
 *
 */

public class TSubjectDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TSubjectDAO.class);

	protected void initDao() {
		// do nothing
	}

	public void save(TSubject transientInstance) {
		log.debug("saving TSubject instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	/**
	 * sava instance and return the instance's id
	 * @author CZX
	 * @param transientInstance
	 * @return
	 * @throws Exception
	 */
	public TSubject saveRe(TSubject transientInstance) {
		try {
			getHibernateTemplate().save(transientInstance);
			getHibernateTemplate().flush();
			return transientInstance; // 为何要返回呢，是因为有些主键类型是自增的，插入成功后才能得到该主键值，所以需要返回PO给调用者
		} catch (Exception ex) {
			throw new RuntimeException("UnChecked Exception occur when creating record: " + ex.getMessage());
		}
	}

	public void delete(TSubject persistentInstance) {
		log.debug("deleting TSubject instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TSubject findById(java.lang.Long id) {
		log.debug("getting TSubject instance with id: " + id);
		try {
			TSubject instance = (TSubject) getHibernateTemplate().get("com.model.TSubject", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TSubject instance) {
		log.debug("finding TSubject instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TSubject instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from TSubject as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all TSubject instances");
		try {
			String queryString = "from TSubject";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TSubject merge(TSubject detachedInstance) {
		log.debug("merging TSubject instance");
		try {
			TSubject result = (TSubject) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TSubject instance) {
		log.debug("attaching dirty TSubject instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TSubject instance) {
		log.debug("attaching clean TSubject instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TSubjectDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TSubjectDAO) ctx.getBean("TSubjectDAO");
	}
}