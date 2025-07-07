package com.example.jpa.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import com.example.jpa.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
