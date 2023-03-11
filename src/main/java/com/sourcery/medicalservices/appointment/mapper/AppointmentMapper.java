package com.sourcery.medicalservices.appointment.mapper;

import com.sourcery.medicalservices.appointment.model.Appointment;
import com.sourcery.medicalservices.appointment.model.AppointmentDto;
import com.sourcery.medicalservices.procedure.mapper.ProcedureMapper;
import com.sourcery.medicalservices.timeslot.mapper.TimeslotMapper;
import java.util.stream.Collectors;

public class AppointmentMapper {
  public static AppointmentDto toDto(Appointment appointment) {

    return AppointmentDto.builder()
      .id(appointment.getId())
      .timeslot(TimeslotMapper.toDto(appointment.getTimeslot()))
      .procedures(appointment.getProcedures().stream()
        .map(ProcedureMapper::toDto).collect(Collectors.toList()))
      .comment(appointment.getComment())
      .build();

  }
}
