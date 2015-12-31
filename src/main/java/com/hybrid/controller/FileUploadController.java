package com.hybrid.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.hybrid.command.LoginCommand;
import com.hybrid.exception.LoginFailException;
import com.hybrid.model.Member;
import com.hybrid.service.LoginService;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	static Log log = LogFactory.getLog(FileUploadController.class);

	@ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public void upload(@RequestParam("file") Part part){
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
    
}
