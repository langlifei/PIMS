package com.zz.entity;

public class PagingVO {

    //当前页码,默认第一页
    private int currentPageNo = 1;
    //总页数
    private int totalCount;
    //页面大小
    private int pageSize=5;
    //上一页
    private int upPageNo;
    //下一页
    private int nextPageNo;
    //要前往的页码,默认0
    private int toPageNo = 0;

    public void setToPageNo(Integer toPageNo) {
        //新一页
        this.toPageNo = (toPageNo-1) * pageSize ;
        //设置跳转后当前的页码
        setCurrentPageNo(toPageNo);
    }

    public Integer getTopageNo() {
        return toPageNo;
    }

    public int getCurrentPageNo() {
        return currentPageNo;
    }

    //设置当前页码
    public void setCurrentPageNo(int curentPageNo) {
        if (curentPageNo != 1) {
            this.upPageNo = curentPageNo - 1;
        }
        //当下一页小于总页数时,才为当前页加1;
        if(curentPageNo+1 <=this.totalCount)
        	this.nextPageNo = curentPageNo + 1;
        else
        	this.nextPageNo=this.totalCount;
        this.currentPageNo = curentPageNo;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        if (totalCount%pageSize > 0) {
            this.totalCount = (totalCount/pageSize)+1;
        } else {
            this.totalCount = totalCount/pageSize;
        }

    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getUpPageNo() {
        return upPageNo;
    }

    public void setUpPageNo(int upPageNo) {
        this.upPageNo = upPageNo;
    }

    public int getNextPageNo() {
        return nextPageNo;
    }

    public void setNextPageNo(int nextPageNo) {
        this.nextPageNo = nextPageNo;
    }
}