package com.ja.ims.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.ims.mapper.BuySQLMapper;
import com.ja.ims.service.BasketService;
import com.ja.ims.service.BuyService;
import com.ja.ims.vo.MemberVO;
import com.ja.ims.vo.ProductWithSellerVO;
import com.ja.ims.vo.Product_Category1VO;
import com.ja.ims.vo.Product_Category2VO;
import com.ja.ims.vo.SessionUserData;
import com.ja.ims.vopoket.PayStepVO;
import com.ja.ims.vopoket.ProductDetail_And_QA;
@Controller
public class BuyController {
	@Autowired
	BuyService buyService;
	@Autowired
	BasketService basketService;
	@Autowired
	BuySQLMapper buySQLMapper;
		//상품리스트
		@RequestMapping("/buyProductList")
		public String buyProductList(HttpServletRequest request, Model model) {
			ArrayList<Product_Category1VO> product_Category1VOList = buyService.getProductCategory1();
			
			//게시물 숫자표시하기
			ArrayList<String> totalNum = new ArrayList<String>();
			for(Product_Category1VO pc1VO : product_Category1VOList) {
				String num;
				ArrayList<ProductWithSellerVO> temp = buyService.getProductC1FilterByOption("name",pc1VO.getP1_idx());
				if(temp == null)num = "0";
				else num = Integer.toString(temp.size());
				totalNum.add(num);
			}
			String[] nums = new String[totalNum.size()];
			System.out.println("totalNum : " + totalNum);
			nums = totalNum.toArray(nums);
			
			
			String page = request.getParameter("page");
			/*String sortOption = request.getParameter("sortOption");*/
			String numOption  =  request.getParameter("numOption");
			if(page==null) 
				page = "1";
			model.addAttribute("page", page);
			model.addAttribute("nums", nums);
			model.addAttribute("totalNum", totalNum);
			model.addAttribute("product_Category1VOList", product_Category1VOList);
			return "/buyProductList";
		}
		
		//카테고리 C1선택한 이후 페이지
				@RequestMapping("/firstCondition")
				public String firstCondition(HttpServletRequest request, Model model) {
					String p1_idx= request.getParameter("p1_idx");
					String p1_name=request.getParameter("p1_name");
					String page = request.getParameter("page");
					if(page==null) 
						page = "1";
					ArrayList<Product_Category2VO> product_Category2VOlist 
						= buyService.getProductCategory2(p1_idx);
					ArrayList<ProductWithSellerVO> productWithSellerVOList
						= buyService.getProductC1FilterByOption("best", p1_idx);
					model.addAttribute("page",1);
					model.addAttribute("p1_idx", p1_idx);
					model.addAttribute("p1_name", p1_name);
					model.addAttribute("product_Category2VOlist", product_Category2VOlist);
					model.addAttribute("productWithSellerVOList", productWithSellerVOList);
					
					return "/firstCondition";
				}
				//카테고리 C2선택한 이후 페이지
				@RequestMapping("/secondCondition")
				public String secondCondition(HttpServletRequest request, Model model) {
					String p1_idx = request.getParameter("p1_idx"); //이전페이지 정보
					String p1_name = request.getParameter("p1_name"); //이전페이지 정보
					String page = request.getParameter("page");
					if(page==null) 
						page = "1";
					System.out.println("p1_idx : " + p1_idx);
					System.out.println("p1_name : " + p1_name);

					String p2_idx = request.getParameter("p2_idx");
					String p2_name 
						=buyService.getProductFinalCategoryName(p2_idx);
					ArrayList<ProductWithSellerVO> productWithSellerVOList
						= buyService.getProductC2FilterByOption("best", p2_idx);
					model.addAttribute("page","1");
					model.addAttribute("p1_idx", p1_idx);
					model.addAttribute("p1_name", p1_name);
					model.addAttribute("p2_idx", p2_idx);
					model.addAttribute("p2_name", p2_name);
					model.addAttribute("productWithSellerVOList", productWithSellerVOList);
					
					return "/secondCondition";
				}
		
		//상품 자세히 보기
		@RequestMapping("/productDetail")
		public String productDetail(HttpServletRequest request, Model model,HttpSession session) {
			String st_idx= request.getParameter("st_idx");
			String page= request.getParameter("page");
			if(page==null) 
				page = "1";
			ProductDetail_And_QA productDetail_And_QA = buyService.getProductDetailBySt_idx(st_idx);
			model.addAttribute("st_idx",st_idx);
			model.addAttribute("page",1);
			model.addAttribute("productDetail_And_QA", productDetail_And_QA);
			return "/productDetail";
		}
		
		//상품Detail에서 질문등록
		@RequestMapping("/questionAboutProduct")
		public String questionAboutProduct(HttpServletRequest request){
			String st_idx = request.getParameter("st_idx");
			String writer_idx = request.getParameter("member_idx");
			String content = request.getParameter("content");
			System.out.println(st_idx+" "+writer_idx+" "+content);
			buyService.insertQuestion(st_idx,writer_idx,content);
			return "redirect:/productDetail?st_idx="+st_idx;
		}
		
		
		
		//배송지 주소를 입력하는 결제화면
		@RequestMapping("/payStep")
		public String payStep(HttpServletRequest request, Model model, HttpSession session) {
			SessionUserData SUD = (SessionUserData)session.getAttribute("SUD");
			String member_idx = SUD.getMember_idx();
			String m_duration = request.getParameter("m_duration");
			
			Calendar cal = new GregorianCalendar(Locale.KOREA);
			cal.add(Calendar.DAY_OF_YEAR, Integer.parseInt(m_duration)); // 하루를 더한다
		    SimpleDateFormat fm = new SimpleDateFormat(
			            "yyyy-MM-dd");
			String arrival = fm.format(cal.getTime());
			String[] st_idxList = request.getParameterValues("st_idx[]");
			String[] m_nameList = request.getParameterValues("m_name");
			String[] finalPs_priceList 
							=request.getParameterValues("finalPs_price");
			String[] itemNumList
							=request.getParameterValues("itemNumList[]");
			System.out.println(st_idxList);
			System.out.println(m_nameList);
			System.out.println(finalPs_priceList);
			System.out.println(itemNumList);
			
			int i = 0;
			ArrayList<PayStepVO> payStepVOList = new ArrayList<PayStepVO>();
			for(String st_idx: st_idxList) {
				payStepVOList.add(
						new PayStepVO(st_idxList[i],m_nameList[i],finalPs_priceList[i],itemNumList[i])
						);
				i++;
			}
			
			String total_price = request.getParameter("total_price");
			MemberVO memberVO = buyService.getAddressAll(member_idx);
			System.out.println("asdasd : " + payStepVOList.size());
			model.addAttribute("payStepVOList",payStepVOList);
			model.addAttribute("total_price",total_price);
			model.addAttribute("memberVO",memberVO);
			model.addAttribute("arrival",arrival);
			return "/confirmBeforePay";
			
		}
		
		
		
		
}
