package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ja.ims.vo.AnswerVO;
import com.ja.ims.vo.ProductQuestion;
import com.ja.ims.vo.QuestionVO;
import com.ja.ims.vopoket.QuestionAndAnswerVO;

public interface QuestionSQLMapper {
	@Select("select * from question where q_identity=#{q_identity}")
	public ArrayList<QuestionVO> SelectMyQuestion(String q_identity);
	//안소현
	
	@Select("select * from question where q_idx=#{q_idx}")
	public QuestionVO SelectQuestionByQ_idx(String q_idx);
	//안소현
	
	@Select("select * from answer where q_idx=#{q_idx}")
	public AnswerVO SelectAnswerByQ_idx(String q_idx);
	//안소현
	
	/*@Select("select citizen.citi_name from answer,citizen,member " + 
			"where answer.a_identity=#{a_identity} "+ 
			"and #{a_identity}=member.member_idx "+ 
			"and citizen.citi_idx=member.citi_idx")
	public String SearchA_identity(String a_identity);*/
	
	/*@Select("select citizen.citi_name from answer,citizen,member where answer.a_identity=#{a_identity} "
			+ "and member.member_idx=answer.a_identity and answer.q_idx=#{q_idx} and citizen.citi_idx=member.citi_idx")
	public String SearchA_identity(@Param("a_identity")String a_identity, @Param("q_idx")String q_idx);*/
	
	
	//로그인한 사용자의 질문과 그에 대한 답변을 가져옴
	@Select("select citizen.citi_name from answer,member,citizen " + 
			"where answer.a_identity=#{a_identity} " + 
			"and answer.q_idx=#{q_idx} " + 
			"and answer.a_identity=member.member_idx " + 
			"and member.citi_idx=citizen.citi_idx ")
	public String SearchA_name(@Param("a_identity")String a_identity,@Param("q_idx")String q_idx);
	//안소현
	
	/*@Select("SELECT O_IDX FROM ORDER_PATIENT_LIST WHERE MEMBER_IDX=#{member_idx} AND O_DATE >= SYSDATE-180")
	public ArrayList<String> selectOrderInfo(String member_idx);*/
	
	//member_idx를 이용하여 order테이블의 정보를 가져오고, medicine테이블과 연결해서 약 이름 갖고옴
	@Select("select * from order_patient_list, order_patient_info,storage,medicine " + 
			"where order_patient_list.member_idx=#{member_idx} " 
			+ "and order_patient_list.o_idx=order_patient_info.o_idx "
			+ "and order_patient_info.st_idx=storage.st_idx "
			+ "and storage.m_idx=medicine.m_idx "
			+ "and order_patient_list.o_date>=sysdate-360")
	public ArrayList<ProductQuestion> selectOrderInfo(String member_idx);
	//안소현
	
	/*@Select("select order_patient_info.o_idx, medicine.m_name, order_patient_info.itemNum, "
			+ "order_patient_list.o_date, order_patient_info.st_idx "
			+ "from order_patient_list, order_patient_info, storage, medicine "
			+ "where order_patient_list.o_idx=#{o_idx} "
			+ "and order_patient_list.o_idx=order_patient_info.o_idx "
			+ "and order_patient_info.st_idx=storage.st_idx "
			+ "and storage.m_idx=medicine.m_idx")
	public ArrayList<ProductQuestion> SelectMyProduct(String o_idx);*/
	
	@Insert("insert into question values(seq_question_idx.nextval,#{q_identity},"
			+ "#{st_idx},#{q_content},0,#{q_type},sysdate)")
	public void insertQuestion(QuestionVO questionVO);
	
	//답변
	@Select("select * from MEMBER M,QUESTION Q,STORAGE S,PHARMACY_SELLER P "
			+ "WHERE P.MEMBER_IDX = M.MEMBER_IDX "
			+ "AND S.ST_IDX = Q.ST_IDX " 
			+ "AND S.PS_IDX = P.PS_IDX "
			+ "AND M.MEMBER_IDX=#{member_idx}")
	ArrayList<QuestionVO> selectQandA(String member_idx);
	
	//질문에 답변 입력
	@Insert("insert into answer values(seq_answer_idx.nextval,#{a_identity},#{a_content},#{q_idx},sysdate)")
	public void insertAnswer(AnswerVO answerVO);
	
	//question테이블에 있는 a_identify를 0에서 작성자의 member_idx로 변환함
	@Update("update question set a_identity=#{a_identity} where q_idx=#{q_idx}")
	public void updateAnswerForQ(@Param("a_identity")String a_identity,@Param("q_idx")String q_idx);
	
	@Delete("delete question where q_idx=#{q_idx}")
	public void deleteQuestion(String q_idx);


}
