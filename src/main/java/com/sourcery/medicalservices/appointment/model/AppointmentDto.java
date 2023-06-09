package com.sourcery.medicalservices.appointment.model;

import java.util.List;
import com.sourcery.medicalservices.procedure.model.ProcedureDto;
import com.sourcery.medicalservices.timeslot.model.TimeslotDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
@AllArgsConstructor
public class AppointmentDto {
  private Long id;
  private TimeslotDto timeslot;
  private List<ProcedureDto> procedures;
  private String comment;
}
