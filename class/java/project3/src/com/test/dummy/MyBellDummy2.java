package com.test.dummy;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MyBellDummy2 {
		
	public static void main(String[] args) {
		Connection conn;
		Statement stat;
		PreparedStatement pstat;
		ResultSet rs;
		DBUtil util = new DBUtil();
		conn = util.open();

		
		File file = new File("D:\\프로젝트3\\알람1.txt");
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(file));
			ArrayList<String> bseq = new ArrayList<String>();
			ArrayList<String> noticeseq = new ArrayList<String>();
			String sql = "select b.seq, b.cusseq, b.showseq, a.noticeseq from tblmybell b inner join (select distinct s.title as showtitle, n.title as noticetitle, n.seq as noticeseq, s.seq as showseq from tblShow s, tblnotice n where n.title like '%' || s.title || '%' order by n.seq) a on b.showseq = a.showseq order by b.seq desc";
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			while(rs.next()) {
				bseq.add(rs.getString("seq"));
				noticeseq.add(rs.getString("noticeseq"));
			}
			for(int i=0;i<bseq.size();i++) {
				sql = String.format("update tblmybell set noticeseq=%s where seq = %s;",noticeseq.get(i),bseq.get(i));
				writer.write(sql);
				writer.newLine();
				/*
				 * pstat = conn.prepareStatement(sql); pstat.executeUpdate();
				 */
			}
			
			writer.close();
			System.out.println("완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
