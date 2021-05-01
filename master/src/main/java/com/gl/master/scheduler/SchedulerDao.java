package com.gl.master.scheduler;

import javax.xml.ws.soap.Addressing;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.gl.master.model.coupon.CouponVo;

public class SchedulerDao {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//���� ����
	public void deleteCUP(String date) {
		// TODO Auto-generated method stub
		sqlSession.delete("scheduler.deleteCoupon", date);		
	}
	//�̺�Ʈ ����
	public void deleteCoupon(String date) {
		// TODO Auto-generated method stub
		sqlSession.insert("scheduler.deleteEvent", date);		
	}

	//��� ����
	public void updateGrade() {
		// TODO Auto-generated method stub
		sqlSession.update("scheduler.updateOneGrade");
		sqlSession.update("scheduler.updateTwoGrade");
		sqlSession.update("scheduler.updateThreeGrade");
	}

	//���� �Է�
	public void insertCoupon() {
		// TODO Auto-generated method stub
		
		CouponVo bean = new CouponVo("", "[��� ����] : 10% ����", 0.1, "������", "");
		
		sqlSession.insert("scheduler.insertCoupon", bean);//1��� ���� �Է�
		
		bean.setCustomid("���ν淯");
		sqlSession.insert("scheduler.insertCoupon", bean);//2��� ���� �Է�
		sqlSession.insert("scheduler.insertCoupon", bean);//2��
		
		bean.setCupname("[��� ����] : 20% ����");
		bean.setPercent(0.2);
		bean.setCustomid("�Ŀ�����");
		sqlSession.insert("scheduler.insertCoupon", bean);//�Ŀ����� ���� �Է�
		sqlSession.insert("scheduler.insertCoupon", bean);//2��
		
		bean.setCupname("[��� ����] : 30% ����");
		bean.setPercent(0.3);
		bean.setCustomid("ī����");
		sqlSession.insert("scheduler.insertCoupon", bean);//ī���� ���� �Է�
		sqlSession.insert("scheduler.insertCoupon", bean);//2��
			
	}
	

}
