package com.its.lilac.controller.search;

import com.its.lilac.service.BookAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BookAPIController {

    @Autowired
    private BookAPIService m_bookAPIService;
}
