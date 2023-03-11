package com.sourcery.medicalservices;

import com.sourcery.medicalservices.security.config.RsaKeyProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.PropertySource;

@EnableConfigurationProperties(RsaKeyProperties.class)
@SpringBootApplication
@PropertySource("application-${spring.profiles.active}.properties")
public class MedicalServicesApplication {
  public static void main(String[] args) {
    SpringApplication.run(MedicalServicesApplication.class, args);
  }
}
