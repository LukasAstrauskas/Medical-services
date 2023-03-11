package com.sourcery.medicalservices.appointment.model;

import com.sourcery.medicalservices.procedure.model.Procedure;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import java.util.List;

@Data
@RequiredArgsConstructor
public class AppointmentRequest {
  private Long timeslotId;
  private String comment;
  private List<Procedure> procedures;
}
