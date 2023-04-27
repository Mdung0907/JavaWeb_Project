package com.fpltn.dao;

import java.util.List;

import org.hibernate.Session;

import com.fpltn.entities.Account;
import com.fpltn.util.HibernateUtil;

public class AccountDao {
	// Tạo hàm thêm
	public static void saveAccount(Account acc) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			session.beginTransaction();
			session.save(acc);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Tạo hàm lấy dữ liệu
	public static List<Account> getAccount() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("from Account", Account.class).list();
		}
	}

	public static Account findById(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			Account dm = session.load(Account.class, id);
			return dm;
		} finally {
			session.close();
		}

	}

	public static Account findAccountbyname(String name) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery(" from Account where username =:name", Account.class).setParameter("name", name)
					.uniqueResult();
		}
	}

	// Lấy danh mục theo id
	public static Account getAccountbyUsname(String username, String password) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("from Account where username = :username and password= :password", Account.class)
					.setParameter("username", username).setParameter("password", password).uniqueResult();
		}
	}

	// xóa danh mục theo ID
	public static void delete(int id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			session.beginTransaction();
			Account acc = session.load(Account.class, id);
			session.delete(acc);
			session.getTransaction().commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	// Cập nhật danh mục
	public static void update(Account acc) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			session.beginTransaction();

			session.update(acc);

			// commit transaction
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
