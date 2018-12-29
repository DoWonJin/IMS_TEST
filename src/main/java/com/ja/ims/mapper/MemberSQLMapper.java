package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ja.ims.vo.AddressMemberVO;
import com.ja.ims.vo.CitizenVO;
import com.ja.ims.vo.FindUserVO;
import com.ja.ims.vo.MemberVO;

public interface MemberSQLMapper {
	
	@Select("SELECT seq_member_idx.NEXTVAL FROM DUAL")
	public String selectMember_seq();
	
	@Select("SELECT seq_pharmacy_seller_idx.nextval from dual")
	public String selectPs_seq();
	
	@Select("select citi_name from citizen, member m where m.citi_idx= citizen.citi_idx and m.member_id=#{member_id}")
	//public String selectById(MemberVO memberVO);
	public String selectById(String member_id);
	
	@Select("SELECT * FROM CITIZEN WHERE citi_identify1 = #{citi_identify1} AND citi_identify2 = #{citi_identify2} AND citi_name= #{citi_name}")
	public CitizenVO selectByIdentify(CitizenVO citizenVO);
	
	@Insert("INSERT INTO MEMBER VALUES(SEQ_MEMBER_IDX.NEXTVAL, #{member_identity},  #{member_nick}, "
			+ "#{member_id}, #{member_pw}, #{member_phone,jdbcType=VARCHAR},"
			+ "#{citi_idx}, #{ps_idx,jdbcType=VARCHAR}, #{member_pic_root,jdbcType=VARCHAR},#{member_address,jdbcType=VARCHAR})")//jdbcType?? 선생님이 알려주신거 적용하기
	public void insertMember(MemberVO memberVO);
	
	@Insert("INSERT INTO MEMBER VALUES(#{member_idx,jdbcType=INTEGER }, #{member_identity},  #{member_nick}, "
			+ "#{member_id}, #{member_pw}, #{member_phone,jdbcType=VARCHAR},"
			+ "#{citi_idx}, #{ps_idx,jdbcType=VARCHAR}, #{member_pic_root,jdbcType=VARCHAR},#{member_address,jdbcType=VARCHAR})")//jdbcType?? 선생님이 알려주신거 적용하기
	public void insertSeller(MemberVO memberVO);
	
	@Insert("INSERT INTO ADDRESS_MEMBER VALUES(seq_ADDRESS_MEMBER_idx.NEXTVAL,#{member_idx },1,#{address,jdbcType=VARCHAR } )")
	public void insertAddress(AddressMemberVO addressMemberVO);
	
	
	@Select("SELECT * FROM MEMBER WHERE member_id= #{member_id}")
	public MemberVO selectByID(MemberVO memberVO);
	
	@Select("SELECT * FROM MEMBER WHERE member_nick= #{member_nick}")
	public MemberVO selectByNick(MemberVO memberVO);
	
	@Select("SELECT * FROM MEMBER WHERE member_id= #{member_id}")
	public MemberVO selectByEmail(MemberVO memberVO);
	
	@Select("SELECT MEMBER.member_id FROM MEMBER, CITIZEN "
			+ "WHERE CITIZEN.citi_name=#{citi_name} "
			+ "AND MEMBER.member_phone=#{member_phone} "
			+ "AND MEMBER.member_identity=#{member_identity} "
			+ "AND MEMBER.citi_idx=CITIZEN.citi_idx")
	public ArrayList<String> findID(FindUserVO findUserVO);
	
	@Select("select member.member_pw from member,citizen "
			+ "where member.member_id=#{member_id} "
			+ "and citizen.citi_name=#{citi_name} "
			+ "and citizen.citi_identify2=#{citi_identify2}")
	public String findPW(FindUserVO findUserVO);
	
	@Select("select * from member where member_idx=#{member_idx}")
	public MemberVO selectMemberVOByMember_idx(String member_idx);
	
	@Insert("UPDATE MEMBER SET member_pic_root=#{pic_root} WHERE member_idx=#{member_idx}")
	public void insertProfilePicture(@Param("pic_root")String pic_root, @Param("member_idx")String member_idx);

	@Update("update member set member_nick=#{member_nick}, member_pw=#{member_pw}, member_phone=#{member_phone}, member_address=#{member_address} "
			+ "where member_idx=#{member_idx}")
	public void updateMember(MemberVO requestMemberVO);
	
	@Insert("INSERT INTO PHARMACY_SELLER VALUES(#{ps_idx,jdbcType=INTEGER},#{member_idx },#{p_name,jdbcType=VARCHAR },null,null,2)")
	public void insertPS(@Param("ps_idx")String ps_idx, @Param("member_idx")String member_idx, @Param("p_name")String p_name);	
	
}