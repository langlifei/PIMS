package com.zz.entity;

import java.util.Date;

public class FinanicialList {

	private int fId;
	private double amount;
	private boolean IncomeOrExpense;
	private Date dateTime;
	private String notes;
	private Etype eType;
	private Ptype pType;
	private int userId;
	
	
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public boolean getIncomeOrExpense() {
		return IncomeOrExpense;
	}
	public void setIncomeOrExpense(boolean incomeOrExpense) {
		IncomeOrExpense = incomeOrExpense;
	}
	public Date getDateTime() {
		return dateTime;
	}
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Etype geteType() {
		return eType;
	}
	public void seteType(Etype eType) {
		this.eType = eType;
	}
	public Ptype getpType() {
		return pType;
	}
	public void setpType(Ptype pType) {
		this.pType = pType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
