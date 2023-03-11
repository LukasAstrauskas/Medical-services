package com.sourcery.medicalservices.user.mapper;

import com.sourcery.medicalservices.user.model.User;
import com.sourcery.medicalservices.user.model.UserDto;

public class UserMapper {

  public static UserDto toDto(User user) {
    return UserDto.builder()
      .id(user.getId())
      .email(user.getEmail())
      .fullName(user.getFullName())
      .birthDate(user.getBirthDate())
      .lastCheckupDate(user.getLastCheckupDate())
      .roles(user.getRoles())
      .build();
  }

}
