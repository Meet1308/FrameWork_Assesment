package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import model.Employee;

public class EmployeeDao {

	private static final SessionFactory sessionFactory;

	static {
		try {
			sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		} catch (Throwable ex) {
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static void addEmployee(Employee e) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tr = session.beginTransaction();
			session.save(e);
			tr.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static List<Employee> showEmployee() {
		List<Employee> list = new ArrayList<>();

		try (Session session = sessionFactory.openSession()) {
			Query<Employee> query = session.createQuery("from Employee", Employee.class);
			list.addAll(query.getResultList());
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;
	}

	public static Employee getEmpById(int id) {
		Employee e = null;
		try (Session session = sessionFactory.openSession()) {
			e = session.get(Employee.class, id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return e;
	}

	public static void updateEmployee(Employee e) {

		try {
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sf.openSession();
			Transaction tr = session.beginTransaction();
			session.update(e);
			tr.commit();
			session.close();
			sf.close();

		} catch (Exception e2) {
			// TODO: handle
			e2.printStackTrace();
		}
	}

	public static void deleteUser(Employee e) {
		try {
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session = sf.openSession();
			Transaction tr = session.beginTransaction();
			session.delete(e);
			tr.commit();
			session.close();
			sf.close();
		} catch (Exception e2) {
			// TODO: handle exception
			e2.printStackTrace();
		}
	}
}
