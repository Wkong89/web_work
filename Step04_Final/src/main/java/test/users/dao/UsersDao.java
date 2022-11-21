package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
   
   private static UsersDao dao;
   //외부에서 객체 생성할수 없도록
   private UsersDao() {}
   //참조값을 리턴해주는 static 메소드
   public static UsersDao getInstance() {
      if(dao==null) {
         dao=new UsersDao();
      }
      return dao;
   }
   
   //인자로 전달된 아이디에 해당하는 가입정보를 리턴해주는 메소드
   public UsersDto getData(String id) {
      
      UsersDto dto=null;
      //필요한 객체를 담을 지역변수를 미리 만들어 둔다. 
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         //Connection Pool 에서 Connection 객체를 하나 얻어온다.
         conn = new DbcpBean().getConn();
         //실행할 sql 문의 뼈대 구성하기
         String sql = "SELECT pwd, email, profile, TO_CHAR(regdate, 'YYYY.MM.DD') AS regdate"
               + " FROM users"
               + " WHERE id=?";
         //sql 문의 ? 에 바인딩 할게 있으면 한다.
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         //SELECT 문을 수행하고 결과값을 받아온다.
         rs = pstmt.executeQuery();
         //ResultSet 에서 필요한 값을 얻어낸다.
         if (rs.next()) {
            dto=new UsersDto();
            dto.setId(id);
            dto.setPwd(rs.getString("pwd"));
            dto.setEmail(rs.getString("email"));
            dto.setProfile(rs.getString("profile"));
            dto.setRegdate(rs.getString("regdate"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close(); //Connection Pool 에 Connection 반납하기
         } catch (Exception e) {
         }
      }
      return dto;
   }

   
   //인자로 전달되는 dto 에 있는 id, pwd 를 이용하여 해당 정보가 유효한 정보인지 여부를 리턴하는 메소드
   public boolean isValid(UsersDto dto) {
	   
	   boolean isValid=false;
	   
	   //필요한 객체를 담을 지역변수를 미리 만들어놓기
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       try {
          //Connection 객체의 참조값 얻어오기 
          conn = new DbcpBean().getConn();
          //실행할 sql 문 작성
          String sql = "SELECT id, pwd"
                + " FROM users"
                + " WHERE id=? AND pwd = ?";
          //PreparedStatement 객체의 참조값 얻어오기
          pstmt = conn.prepareStatement(sql);
          //? 에 바인딩할 내용이 있으면 여기서 바인딩
          pstmt.setString(1, dto.getId());
          pstmt.setString(2, dto.getPwd());
          //select 문 수행하고 결과를 ResultSet 으로 받아오기
          rs = pstmt.executeQuery();
          //select 된 결과가 있다면 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
          if (rs.next()) {
             //TodoDto 객체를 생성해서 select 된 결과를 담아준다. 
             isValid = true;
          }
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          try {
             if (rs != null)
                rs.close();
             if (pstmt != null)
                pstmt.close();
             if (conn != null)
                conn.close();
          } catch (Exception e) {
          }
       }
       return isValid;
    }
   //회원 한명의 정보를 DB 에 저장하고 성공여부를 리턴하는 메소드 
   public boolean insert(UsersDto dto) {//UsersDto 에 id, pwd, email 이 있다. 
      Connection conn = null;
      PreparedStatement pstmt = null;
      int rowCount = 0;
      try {
         conn = new DbcpBean().getConn();
         String sql = "INSERT INTO users"
               + " (id, pwd, email, regdate)"
               + " VALUES(?, ?, ?, SYSDATE)";
         pstmt = conn.prepareStatement(sql);
         // ? 에 바인딩할게 있으면 해주고
         pstmt.setString(1, dto.getId());
         pstmt.setString(2, dto.getPwd());
         pstmt.setString(3, dto.getEmail());
         // INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
         rowCount = pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if (pstmt != null)
               pstmt.close();
            if (conn != null)
               conn.close();
         } catch (Exception e) {
         }
      }
      if (rowCount > 0) {
         return true;
      } else {
         return false;
      }
   }
}







