package com.fpltn.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.fpltn.entities.Account;
import com.fpltn.entities.Danhmuc;
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
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery(" from Product", Product.class).list();
		}
	}
	public static List<Product> getProductbyName(String name) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery(" from Product where name like :tukhoa", Product.class).setParameter("tukhoa","%"+ name+"%").list();
		}
	}
	
	public static List<Product> getProductbyNguoitao(int name) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery(" from Product where nguoitao = :tukhoa", Product.class).setParameter("tukhoa",name).list();
		}
	}
	
	public static List<Product> getProduct(int viTri, int soLuong) {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
		  Query query = session.createQuery(" from Product as Product", Product.class);
		  query.setFirstResult(viTri);
		  query.setMaxResults(soLuong);
		  return query.list();
		}
	}
	
	public static List<Product> getProductbyDanhmuc(int viTri, int soLuong,int danhmuc) {
		Danhmuc pro=DanhmucDao.findById(danhmuc);
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
		  Query query = session.createQuery(" from Product as Product where danhmuc =:danhmuc", Product.class).setParameter("danhmuc", pro);
		  query.setFirstResult(viTri);
		  query.setMaxResults(soLuong);
		  return query.list();
		}
	}
	
	public static long DemSoLuongProduct() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
		  String countQ = "Select count (Product.id) from Product Product";
		  Query countQuery = session.createQuery(countQ);
		  return (Long) countQuery.uniqueResult();
		}
	}
	
	public static long DemSoLuongProduct(String name) {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
		  String countQ = "Select count (Product.id) from Product Product where name like :name";
		  Query countQuery = session.createQuery(countQ).setParameter("name", "%"+name+"%");
		  return (Long) countQuery.uniqueResult();
		}
	}

	public static List<Product> getProductbyAccount(int acc) {
		Account pro=AccountDao.findById(acc);
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery(
					"from Product where nguoitao = :pro",
					Product.class).setParameter("pro", pro).list();
		}
	}
	
	/*
	 * public static List<Product> getProductbyDanhmuc(int acc) { Danhmuc
	 * pro=DanhmucDao.findById(acc); try (Session session =
	 * HibernateUtil.getSessionFactory().openSession()) { return
	 * session.createQuery( "from Product where danhmuc = :pro",
	 * Product.class).setParameter("pro", pro).list(); } }
	 */

	// Lấy danh mục theo id
	public static Product findById(int id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Product pd = session.load(Product.class, id);
			return pd;
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
