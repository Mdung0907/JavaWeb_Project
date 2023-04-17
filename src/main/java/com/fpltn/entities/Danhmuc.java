package com.fpltn.entities;
// Generated Apr 10, 2023, 10:48:36 AM by Hibernate Tools 4.3.6.Final


import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Danhmuc generated by hbm2java
 */
@Entity
@Table(name = "danhmuc", catalog = "qlmyweb")
public class Danhmuc implements java.io.Serializable {

	private Integer id;
	private String tendanhmuc;
	private String mota;

	public Danhmuc() {
	}

	public Danhmuc(String tendanhmuc, String mota) {
		this.tendanhmuc = tendanhmuc;
		this.mota = mota;

	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "tendanhmuc", length = 45)
	public String getTendanhmuc() {
		return this.tendanhmuc;
	}

	public void setTendanhmuc(String tendanhmuc) {
		this.tendanhmuc = tendanhmuc;
	}

	@Column(name = "mota", length = 50)
	public String getMota() {
		return this.mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}



}
