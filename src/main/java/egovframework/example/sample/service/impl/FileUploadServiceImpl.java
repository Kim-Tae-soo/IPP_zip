package egovframework.example.sample.service.impl;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.sample.service.FileUploadService;
//FileUploadServiceImpl.java

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;

@Service
public class FileUploadServiceImpl implements FileUploadService {
 @Override
 public void uploadFile(MultipartFile file, String uploadPath, String savedFilename) {
     try {
         String filePath = uploadPath + File.separator + savedFilename;
         file.transferTo(new File(filePath));
     } catch (IOException e) {
         // Handle file upload exception
     }
 }
}
