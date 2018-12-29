package com.ja.ims.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.ims.service.BuyService;
import com.ja.ims.vo.ProductWithSellerVO;

@Controller
public class OrderOptionController {
	
	private final static String categoryAll = "0";
	private final static String category1filter = "1";
	private final static String category2filter = "2";
	
	@Autowired
	BuyService buyService;
		@RequestMapping("/orderOption")
		public String orderOption(HttpServletRequest request, Model model) {
			ArrayList<ProductWithSellerVO> productWithSellerVOList 
				= new ArrayList<ProductWithSellerVO>();
			ArrayList<ProductWithSellerVO> productWithSellerVOList_segment 
			= new ArrayList<ProductWithSellerVO>();
			
			String p1_idx = request.getParameter("p1_idx");
			String p2_idx = request.getParameter("p2_idx");
			
			String sortOption = request.getParameter("sortOption");
			String numOption =  request.getParameter("numOption");
			String categoryNum = request.getParameter("categoryNum");
			String page_temp = request.getParameter("page");                          

			
			System.out.println("\n\n\n검색시작.....");
			System.out.println("sortOption :" + sortOption);
			System.out.println("numOption :" + numOption);
			System.out.println("categoryNum :" + categoryNum);
			System.out.println("page번호:" + page_temp);
			
			//현 페이지에 보여줄 게시물 갯수
			int listCount = 2;
			if(numOption.equals("0")) {
				listCount = 5;
			}else if(numOption.equals("1")) {
				listCount = 10;
			}else if(numOption.equals("2")) {
				listCount = 20;
			}else if(numOption.equals("3")) {
				listCount = 30;
			}else if(numOption.equals("4")) {
				listCount = 40;
			}else {
				
			}
			
			
			//페이지 종류에 따라 분류. 내부 메소드에서 best,name,price결정하도록 orderOption도 넘겨줌
			if(categoryNum.equals("0")) {
				productWithSellerVOList 
					= buyService.getProductAllByOption(sortOption);
			}else if(categoryNum.equals("1")){
				productWithSellerVOList 
					= buyService.getProductC1FilterByOption(sortOption,p1_idx);
			}else { //category2인경우
				productWithSellerVOList 
				= buyService.getProductC2FilterByOption(sortOption,p2_idx);
			}
			//test코드
			if(productWithSellerVOList == null) {
				System.out.println("모든 재고가 없음");
				model.addAttribute("productWithSellerVOList_segment", productWithSellerVOList_segment);
				return "/buyProductListOption";
			}
			int totalCount = productWithSellerVOList.size();
			System.out.println("전체 게시물 수 : " + totalCount);
			System.out.println("한 페이지에 보여줄 게시물 수 : " + listCount);
			int totalPage;
			totalPage = totalCount / listCount;									   
			if (totalCount % listCount >= 0) {
			    totalPage++;
			}
			System.out.println("전체 페이지 수: " + totalPage);

			//System.out.println("totalPage : " + totalPage);
			//요청 페이지 번호
			int page = Integer.parseInt(page_temp);
			//System.out.println("page: " + page);
			if (totalPage < page){
			    page = totalPage;
			}
			//하단에 보여줄 페이지 번호 갯수
			int pageCount = 10;
			int startPage = ((page - 1) / pageCount) * pageCount + 1;
			//현재 페이지가 pageCount와 같을 때를 유의하며 (page-1)을 하고
			// +1은 첫페이지가 0이나 10이 아니라 1이나 11로 하기 위함임
			int endPage = startPage + pageCount - 1;
			// -1은 첫페이지가 1이나 11 등과 같을때 1~10, 11~20으로 지정하기 위함임
			if (endPage > totalPage) {
			    endPage = totalPage;
			}
			int start_st_idx = (page-1)*listCount;
			int end_st_idx =  page * listCount - 1 ; 
			/*System.out.println("start_st_idx: " + start_st_idx);
			System.out.println("end_st_idx: " + end_st_idx);
			System.out.println("page: " + page);*/
			if(page == totalPage) {
				System.out.println("마지막 페이지");
				for(int i=start_st_idx; i< totalCount; i++) { //한 페이지에 보여줄 상품만 담는다
					productWithSellerVOList_segment.add(
							productWithSellerVOList.get(i)
							);
				}
			}else{
				System.out.println("페이징 중간");
				for(int i=start_st_idx; i< start_st_idx+listCount; i++) { //한 페이지에 보여줄 상품만 담는다
										
					//System.out.println("i : " + i);
					productWithSellerVOList_segment.add(
							productWithSellerVOList.get(i)
							);
				}
			}
			model.addAttribute("totalCount", productWithSellerVOList.size());
			model.addAttribute("totalPage",totalPage);
			model.addAttribute("pageCount",pageCount);
			model.addAttribute("productWithSellerVOList_segment", productWithSellerVOList_segment);
			//test
			//for(ProductWithSellerVO a: productWithSellerVOList_segment)System.out.println(a);
			return "/buyProductListOption";
		}
	
}
