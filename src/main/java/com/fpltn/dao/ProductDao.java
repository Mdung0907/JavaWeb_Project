package com.fpltn.dao;

import java.util.List;

import org.hibernate.Session;

import com.fpltn.entities.Account;
import com.fpltn.entities.Product;
import com.fpltn.util.HibernateUtil;

public class ProductDao {
	// Tạo hàm thêm
	public static void saveProduct(Product dm) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			session.beginTransaction();
			session.save(dm);
			session.getTransaction().commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	// Tạo hàm lấy dữ liệu
	public static List<Product> getProduct() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery(" from Product", Product.class).list();
		}
	}

	public static List<Product> getProductbyAccount(int idus) {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery(
					"select * from Product join Account on Product.nguoitao=Account.id where Product.nguoitao=?1",
					Product.class).setParameter(1, idus).getResultList();
		}
	}

	// Lấy danh mục theo id
	public static Product findById(int id) {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			Product dm = session.load(Product.class, id);
			System.out.print(dm);
			return dm;
		}

	}

	// xóa danh mục theo ID
	public static void delete(int id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			session.beginTransaction();

			Product dm = session.load(Product.class, id);
			session.delete(dm);

			// commit transaction
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Cập nhật danh mục
	public static void update(Product dm) {

		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			session.beginTransaction();

			session.update(dm);

			// commit transaction
			session.getTransaction().commit();
		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
