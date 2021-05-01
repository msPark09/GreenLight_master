package com.gl.master.scheduler;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gl.master.CustomerController;
import com.gl.master.model.customer.CustomerDaoImp;

@Component
public class Scheduler {

	private static final Logger logger = LoggerFactory
			.getLogger(Scheduler.class);

	@Autowired
	private SchedulerDao schedulerDao;

	/*
	 * �� �� �� �� �� ��(��) 
	 * "0 0 12 * * ?" : �ƹ� ����, �ſ�, ����
	 *  12:00:00 "0 15 10 ? * *" :��� ����, �ſ�, �ƹ� ���̳� 
	 *  10:15:00 "0 15 10 * * ?" : �ƹ� ����, �ſ�, ���� 10:15:00
	 * "0 15 10 * * ? *" : ��� ����, �ƹ� ����, �ſ�, ���� 10:15 
	 * "0 15 10 * * ? : 2005" 2005�� �ƹ� �����̳� �ſ�, ���� 10:15 "0 * 14 * * ?" : �ƹ� ����, �ſ�, ����, 14�� �ź� 0��
	 * "0 0/5 14 * * ?" : �ƹ� ����, �ſ�, ����, 14�� �� 5�и��� 0�� "0 0/5 14,18 * * ?" : �ƹ�
	 * ����, �ſ�, ����, 14��, 18�� �� 5�и��� 0�� "0 0-5 14 * * ?" : �ƹ� ����, �ſ�, ����, 14:00 ����
	 * �� 14:05���� �� �� 0�� "0 10,44 14 ? 3 WED" : 3���� �� �� ������, �ƹ� ��¥�� 14:10:00,
	 * 14:44:00 "0 15 10 ? * MON-FRI" : ��~��, �ſ�, �ƹ� ���̳� 10:15:00
	 * "0 15 10 15 * ?" : �ƹ� ����, �ſ� 15�� 10:15:00 "0 15 10 L * ?" : �ƹ� ����, �ſ� ������
	 * �� 10:15:00 "0 15 10 ? * 6L" : �ſ� ������ �ݿ��� �ƹ� ���̳� 10:15:00
	 * "0 15 10 ? * 6L 2002-2005" : 2002����� 2005����� �ſ� ������ �ݿ��� �ƹ� ���̳� 10:15:00
	 * "0 15 10 ? * 6#3" : �ſ� 3��° �ݿ��� �ƹ� ���̳� 10:15:00
	 */
	// coupon ��� �⵵,�ƹ�����,�ſ�,���� 9:0:0
	@Scheduled(cron = "0 0 9 * * ?")
	public void schedulerDelete() {
		logger.info("Scheduler: �Ⱓ�� ���� �����͸� �����մϴ�.");
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = dayTime.format(new Date(time - 1000 * 24 * 60 * 60));
		logger.info(sysdate.toString());
		schedulerDao.deleteCUP(sysdate);// ���� ������ �´� ���� ����
		schedulerDao.deleteCoupon(sysdate);// ���� ������ �´� �̺�Ʈ ����
	}

	// ���� �Ⱓ �ƹ�����, �ſ� 1�� 9:0:0
	@Scheduled(cron = " 0 0 10 1 * ?")
	public void schedulerUpdate() {
		logger.info("Scheduler: �ſ� ���� ����� update�մϴ�.");
		schedulerDao.updateGrade();
		schedulerDao.insertCoupon();
	}
	// �� ���, ���� �Է�

}
