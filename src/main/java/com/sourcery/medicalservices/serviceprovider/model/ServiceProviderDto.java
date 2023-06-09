package com.sourcery.medicalservices.serviceprovider.model;

import com.sourcery.medicalservices.procedure.model.ProcedureDto;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
@AllArgsConstructor
public class ServiceProviderDto {

  private Long id;
  private String name;
  private List<ProcedureDto> procedures;

}
