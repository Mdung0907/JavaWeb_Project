package com.fpltn.dao;

import java.util.List;

import org.hibernate.Session;


import com.fpltn.entities.Danhmuc;

import com.fpltn.util.HibernateUtil;

public class DanhmucDao {
	// Tạo hàm thêm
	public static void saveDanhmuc(Danhmuc dm) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			session.beginTransaction();
			session.save(dm);
			session.getTransaction().commit();
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	// Tạo hàm lấy dữ liệu
	public static List<Danhmuc> getDanhmuc() {
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery(" from Danhmuc", Danhmuc.class).list();
		}
	}

	//Lấy danh mục theo id
	public static Danhmuc findById(int id) {	
		try (Session session = (Session) HibernateUtil.getSessionFactory().openSession()) {		
			Danhmuc dm = session.load(Danhmuc.class, id);
			System.out.print(dm);
			return dm;
		} 
			
	}
	
	//xóa danh mục theo ID
	public static void delete(int id) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			// start a transaction
			 session.beginTransaction();
			
			Danhmuc dm = session.load(Danhmuc.class, id);
			session.delete(dm);
			
			
			// commit transaction
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Cập nhật danh mục
	public static void update(Danhmuc dm) {
		
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
