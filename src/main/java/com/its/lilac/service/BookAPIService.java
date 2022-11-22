package com.its.lilac.service;

import com.its.lilac.repository.BookAPIRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookAPIService {

    @Autowired
    private BookAPIRepository m_bookAPIRepository;
}
