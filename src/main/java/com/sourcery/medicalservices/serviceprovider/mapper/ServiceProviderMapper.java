package com.sourcery.medicalservices.serviceprovider.mapper;

import com.sourcery.medicalservices.procedure.mapper.ProcedureMapper;
import com.sourcery.medicalservices.serviceprovider.model.ServiceProviderDto;
import com.sourcery.medicalservices.serviceprovider.model.ServiceProvider;
import java.util.stream.Collectors;

public class ServiceProviderMapper {

  public static ServiceProviderDto toDto(ServiceProvider serviceProvider) {
    return ServiceProviderDto.builder()
      .id(serviceProvider.getId())
      .name(serviceProvider.getCompanyName())
      .procedures(serviceProvider.getProcedures().stream()
        .map(ProcedureMapper::toDto)
        .collect(Collectors.toList()))
      .build();
  }

}
