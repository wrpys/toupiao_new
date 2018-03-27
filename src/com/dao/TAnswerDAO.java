package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.model.TAnswer;

/**
 * TAnswerDAO
 * @author CZX
 *
 */

public class TAnswerDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TAnswerDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TAnswer transientInstance)
	{
		log.debug("saving TAnswer instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TAnswer persistentInstance)
	{
		log.debug("deleting TAnswer instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TAnswer findById(java.lang.String id)
	{
		log.debug("getting TAnswer instance with id: " + id);
		try
		{
			TAnswer instance = (TAnswer) getHibernateTemplate().get(
					"com.model.TAnswer", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TAnswer instance)
	{
		log.debug("finding TAnswer instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TAnswer instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TAnswer as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TAnswer instances");
		try
		{
			String queryString = "from TAnswer";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TAnswer merge(TAnswer detachedInstance)
	{
		log.debug("merging TAnswer instance");
		try
		{
			TAnswer result = (TAnswer) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TAnswer instance)
	{
		log.debug("attaching dirty TAnswer instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TAnswer instance)
	{
		log.debug("attaching clean TAnswer instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TAnswerDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TAnswerDAO) ctx.getBean("TAnswerDAO");
	}
}