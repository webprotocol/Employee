package com.hybrid.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Part;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	static Log log = LogFactory.getLog(FileUploadController.class);

	@ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public void upload(@RequestParam("file") Part part, String username){
		log.info("username=" + username);
        log.info("part.name=" + part.getName());
        log.info("content-disposition=" +  part.getHeader("content-disposition"));
        log.info("ContentType=" + part.getContentType());
        log.info("size=" + part.getSize());
        log.info("fname=" + part.getSubmittedFileName());
        
        String fname = part.getSubmittedFileName();
        fname = fname.substring(fname.lastIndexOf("\\") + 1);
        
        System.out.println("name=" + fname);
        
        try {
            part.write(fname);
            
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
	
	@ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/uploads", method = RequestMethod.POST)
    public void uploads(Part[] parts){
//		log.info("username=" + username);
//        log.info("part.name=" + part.getName());
//        log.info("content-disposition=" +  part.getHeader("content-disposition"));
//        log.info("ContentType=" + part.getContentType());
//        log.info("size=" + part.getSize());
//        log.info("fname=" + part.getSubmittedFileName());
//        
//        String fname = part.getSubmittedFileName();
//        fname = fname.substring(fname.lastIndexOf("\\") + 1);
//        
//        System.out.println("name=" + fname);
//        
//        try {
//            part.write(fname);
//            
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
    }    
}
