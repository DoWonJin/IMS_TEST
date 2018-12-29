package com.ja.ims.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ja.ims.vo.AnswerVO;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.ProductWithSellerVO;
import com.ja.ims.vo.Product_Category1VO;
import com.ja.ims.vo.Product_Category2VO;
import com.ja.ims.vo.QuestionVO;
import com.ja.ims.vopoket.ProductDetailVO;

public interface BuySQLMapper {
	//카테고리 1 목록
	@Select("select * from product_category1 order by p1_name")
	public ArrayList<Product_Category1VO> selectProductCategory1();
	
	//카테고리 2 목록
	@Select("select * from product_category2 where p1_idx=#{p1_idx} order by p2_name")
	public ArrayList<Product_Category2VO> selectProductCategory2(String p1_idx);
	
	//카테고리2 이름 (카테고리2 최종선택시) 
	@Select("select p2_name from product_category2 where p2_idx=#{p2_idx}")
	public String selectFinalCategoryName(String p2_idx);
	
	//카테고리1 선택후 상품리스트 화면
	//비정렬 게시글 번호뽑아오기
	@Select("select st_idx from storage, medicine, product_category2 where medicine.m_idx=storage.m_idx and medicine.p2_idx= product_category2.p2_idx and product_category2.p1_idx=#{p1_idx} AND storage.m_storage>0")
	public ArrayList<String> selectST_IdxByC1FilterList(String p1_idx);
	
	
	
	//카테고리2 선택후 상품리스트 화면
	//비정렬 게시글 번호뽑아오기
	@Select("select st_idx from storage, medicine where medicine.m_idx=storage.m_idx and medicine.p2_idx= #{p2_idx} AND storage.m_storage>0")
	public ArrayList<String> selectST_IdxByC2FilterList(String p2_idx);

		//Ajax처리
			//게시물 번호 리스트로 뽑기 : STORAGE
			@Select("SELECT st_idx FROM STORAGE ,PHARMACY_SELLER WHERE STORAGE.m_storage>0 AND STORAGE.PS_IDX = PHARMACY_SELLER.PS_IDX AND PHARMACY_SELLER.PS_IDENTITY=2")
			public ArrayList<String> selectST_IdxList();
		 
			//BEST상품추천
			@Select("SELECT A.ST_IDX, sum(NVL(A.itemnum,0))" + 
					"FROM (Select S.st_idx,O.o_idx,O.ITEMNUM from STORAGE S" + 
					"        left join ORDER_PATIENT_INFO O" + 
					"        on S.ST_IDX = O.st_idx" + 
					"        order by st_idx) A " + 
					"left join ORDER_PATIENT_LIST B " + 
					"on B.O_IDX = A.O_IDX " + 
					"WHERE B.O_DATE BETWEEN SYSDATE-365 AND SYSDATE " + 
					"AND A.st_idx in (${st_IdxList})  " + 
					"GROUP BY A.ST_IDX " + 
					"order by sum(NVL(A.itemnum,0))")
			//@ResultType(value=java.lang.String.class)
			public ArrayList<String> selectBestSortedST_IdxList(@Param("st_IdxList")String st_IdxList);
			
			//이름순
			@Select("SELECT STORAGE.st_idx"
					+ " FROM STORAGE,MEDICINE"
					+ " WHERE STORAGE.m_idx = MEDICINE.m_idx"
					+ " AND STORAGE.st_idx in (${st_IdxList})"
					+ " ORDER BY MEDICINE.m_name")
			public ArrayList<String> selectNameSortedST_IdxList(@Param("st_IdxList")String st_IdxList);
			
			//가격순
			@Select("SELECT STORAGE.st_idx"
					+ " FROM STORAGE"
					+ " WHERE STORAGE.st_idx in (${st_IdxList})"
					+ " ORDER BY ps_price")
			public ArrayList<String> selectLowPriceSortedST_IdxList(@Param("st_IdxList")String st_IdxList);
			
			@Select("SELECT STORAGE.st_idx"
					+ " FROM STORAGE"
					+ " WHERE STORAGE.st_idx in (${st_IdxList})"
					+ " ORDER BY ps_price DESC")
			public ArrayList<String> selectHighPriceSortedST_IdxList(@Param("st_IdxList")String st_IdxList);
			
			//정렬 마지막 과정 (공통코드)
			//STORAGE, MEDICINE 단 결과로 가져오는거는 MEDICINE에만 있다.
			@Select("select * from storage, medicine where storage.m_idx=medicine.m_idx and storage.st_idx= #{st_idx}")
			public ProductWithSellerVO selectProduct(String st_idx);
		
	//productDetail
		//업체 이름
		@Select("select member_nick from member, storage where storage.st_idx= #{st_idx} and storage.ps_idx=member.ps_idx")
		public String selectSellerNickBySt_idx(String st_idx);
		//상품 디테일VO
		@Select("select * from medicine, storage where storage.st_idx= #{st_idx} and storage.m_idx=medicine.m_idx")
		public ProductDetailVO selectProductDetailBySt_idx(String st_idx);
		//질문답변VOList만드는 과정
			//질문VOList가져오기
			@Select("select *from question where st_idx = #{st_idx} order by q_date desc")
			public ArrayList<QuestionVO> selectQuestionAll(String st_idx);
			//답변VO가져오기
			@Select("select *from answer where q_idx = #{q_idx} order by a_date desc")
			public AnswerVO selectAnswerVOByQ_idx(String q_idx);
		//질문등록
		@Insert("insert into question values(seq_QUESTION_idx.nextval,#{writer_idx},#{st_idx},#{content},0,1,SYSDATE)")
		public void insertQuestion(@Param("st_idx")String st_idx, @Param("writer_idx")String writer_idx, @Param("content")String content);
	
	//결제시 배송주소 불러오기
	@Select("SELECT *FROM MEMBER WHERE member_idx = #{member_idx}")
	public MemberVO selectAddressAll(String member_idx);
}
	
