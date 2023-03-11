package com.sourcery.medicalservices.procedure.mapper;

import com.sourcery.medicalservices.procedure.model.Procedure;
import com.sourcery.medicalservices.procedure.model.ProcedureDto;

public class ProcedureMapper {

  public static ProcedureDto toDto(Procedure procedure) {
    return ProcedureDto.builder()
      .id(procedure.getId())
      .name(procedure.getProcedureName())
      .description(procedure.getDescription())
      .price(procedure.getPrice())
      .build();
  }

}
