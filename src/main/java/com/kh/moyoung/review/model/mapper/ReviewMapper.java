package com.kh.moyoung.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.moyoung.review.model.vo.Review;

@Mapper
public interface ReviewMapper {

	int selectReviewCount();

	List<Review> selectReviewList(RowBounds rowBounds);

	int insertReview(Review review);

}
