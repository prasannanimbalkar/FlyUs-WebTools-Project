package com.fly.us.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.fly.us.exception.AdException;
import com.fly.us.pojo.Airline;

public class AirlinerDao extends DAO {

	public Airline create(String airlineName, String owner) throws AdException {
		try {
			begin();
			Airline airplane = new Airline(airlineName, owner);
			getSession().save(airplane);
			commit();
			return airplane;
		} catch (HibernateException e) {
			rollback();
			throw new AdException("Airline couldn't be added", e);
		} finally {
			close();
		}

	}

	public void updateAirplane(Airline airplane) throws AdException {
		try {
			begin();
			getSession().merge(airplane);
			commit();
		} catch (HibernateException e) {
			rollback();
			throw new AdException("Airline couldn't be updated", e);
		} finally {
			close();
		}
	}

	public Airline searchAirplaneByID(long airplane_id) throws AdException {
		try {

			begin();
			Query q = getSession().createQuery("from Airline where airplane_id = :airplane_id");
			q.setLong("airplane_id", airplane_id);
			Airline airplane = (Airline) q.uniqueResult();
			commit();
			return airplane;
		} catch (HibernateException e) {
			rollback();
			throw new AdException(
					"Airplane with following Id couldn'te be found: " + airplane_id + " " + e.getMessage());
		} finally {
			close();
		}
	}

	public int deleteAirplane(long airplane_id) throws AdException {

		try {
			Airline airplane = searchAirplaneByID(airplane_id);

			if (airplane == null) {
				return 0;
			}
			begin();
			getSession().delete(airplane);
			commit();
			return 1;

		} catch (HibernateException e) {
			rollback();
			throw new AdException("Airplane with following Id couldn't be deleted", e);

		} finally {
			close();
		}

	}
	
	
	public List airlinesDetails() throws AdException {

		List<String> list = null;

		try {
			begin();
			Query q = getSession().createQuery("from Airline");
			list = q.list();
			commit();
			return list;
		}

		catch (HibernateException e) {
			rollback();
			throw new AdException("Error while fecthing all flights", e);
		} finally {
			close();
		}

	}

}
