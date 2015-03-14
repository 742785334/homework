package edu.homework.common.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 根据DAO层返回的当前页数据对象List、数据对象总记录数与原Service层接收到的当前页，当前分页、页面最大数据条数
 * 
 * 计算总分页数、上一页页码、下一页页码
 * 
 * @author HeHangjie
 * 
 * @param <T>D
 */
public class PageResult<T extends Serializable> {
	private List<T> currentList; // 当前页的结果集
	private int allResult;// 数据对象总记录数
	private int currentPage;// 当前分页
	/**
	 * 计算部分
	 */
	private int allPage;// 总分页数
	private int per;// 上一页页码
	private int next; // 下一页页码

	public PageResult(List<T> currentList, int allResult, int currentPage,
			int max) {

		this.currentList = currentList;
		this.allResult = allResult;
		this.currentPage = currentPage;

		// 计算总分页数
		if (allResult % max == 0) {
			allPage = allResult / max;
		} else {
			allPage = allResult / max + 1;
		}

		// 计算上一页页码页
		this.per = 1;
		if (currentPage > 1) {
			this.per = currentPage - 1;
		}

		// 计算下一页页码页
		this.next = allPage;
		if (currentPage < allPage - 1) {
			this.next = currentPage + 1;
		}

	}

	public List<T> getCurrentList() {
		return currentList;
	}

	public int getAllResult() {
		return allResult;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getAllPage() {
		return allPage;
	}

	public int getPer() {
		return per;
	}

	public int getNext() {
		return next;
	}

}
