package com.project.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.product.vo.PaymentVO;

@RestController
public class PaymentController {
	
	@GetMapping(value = "/ProductPayment", produces="text/plain; charset=utf-8")
	public int ProductPayment(@RequestBody PaymentVO vo) {
		System.out.println(vo);
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		System.out.println("결제");
		return 1;
	}
	
}
