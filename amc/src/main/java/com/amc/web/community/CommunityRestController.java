package com.amc.web.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amc.common.Page;
import com.amc.common.Search;
import com.amc.service.community.CommunityService;
import com.amc.service.domain.Comment;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;

	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	// �ظ� �߰�
	@RequestMapping(value = "json/addComment", method = RequestMethod.POST)
	public void addComment(@RequestBody Comment comment) {

		System.out.println("communityRestController�� addComment���� ");

		System.out.println("1.comment ==> " + comment);
		communityService.addComment(comment);
		/// screenService.addScreenContent(screenContent);
		System.out.println("communityRestController addComment :: POST ��.....");

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/updateComment", method = RequestMethod.POST)
	public void updateComment(@RequestBody Comment comment) {

		System.out.println("communityRestController�� updateComment���� ");

		System.out.println("1.movieComment ==> " + comment);
		communityService.updateComment(comment);
		/// screenService.addScreenContent(screenContent);
		System.out.println("communityRestController updateComment :: POST ��.....");

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/deleteComment/{commentNo}", method = RequestMethod.GET)
	public int deleteComment(@PathVariable int commentNo) {

		System.out.println("communityRestController�� deleteComment���� ");

		System.out.println("1.commentNo ==> " + commentNo);
		int deleteComment = communityService.deleteComment(commentNo);
		/// screenService.addScreenContent(screenContent);
		System.out.println(" communityRestController deleteComment :: POST ��.....");
		System.out.println(communityService.deleteComment(commentNo) + "+++++++++++++");
		return deleteComment;

	};

	// �ظ� �߰�
	@RequestMapping(value = "json/getCommentList/{freeBoardNo}")
	public List<Comment> getCommentList(@ModelAttribute("search") Search search, @PathVariable int freeBoardNo)
			throws Exception {
		System.out.println("communityRestController�� getCommentList���� ");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println("???????????????????????????????????????????????? " + search.getStartRowNum());
		if (search.getStartRowNum() == 2) {
			search.setStartRowNum(2);
		} else if (search.getStartRowNum() == 1) {
			search.setStartRowNum(2);
		} else {
			search.setStartRowNum(0);
		}

		search.setPageSize(pageSize);

		System.out.println("1. search ==> " + search);
		System.out.println("2. freeBoardNo ==> " + freeBoardNo);

		List<Comment> list = communityService.getCommentList(search, freeBoardNo);

		System.out.println("4. list ==> ?" + list);

		System.out.println("communityRestController�� getCommentList :: POST ��.....");

		return list;
	}

	@RequestMapping(value = "json/getFreeBoardTotalCount/{freeBoardNo}")
	public Page getFreeBoardTotalCount(@ModelAttribute("search") Search search, @PathVariable int freeBoardNo)
			throws Exception {

		System.out.println("communityRestController�� getFreeBoardTotalCount ����...");
		System.out.println("1. search�� ==> " + search);
		System.out.println("2. freeBoardNo ==> " + freeBoardNo);
		int getFreeBoardTotalCount = communityService.getFreeBoardTotalCount(freeBoardNo);
		System.out.println("3. getTotalCount�� �� ==> " + getFreeBoardTotalCount);

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(pageSize);

		System.out.println("4. search ==> " + search);

		System.out.println("5. getFreeBoardTotalCount ==> " + getFreeBoardTotalCount);

		Page resultPage = new Page(search.getCurrentPage(), getFreeBoardTotalCount, pageUnit, pageSize);
		System.out.println("6. resultPage ==> " + resultPage);

		System.out.println("communityRestController�� freeBoardCommentList�޼ҵ� ��");

		return resultPage;

	}

}
