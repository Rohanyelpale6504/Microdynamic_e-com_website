package com.nt.service;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nt.Entity.Customer;
import com.nt.Reposetory.CustomerRepository;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository reposetoery;
//for fetch the list from the database
    public List<Customer> list(Customer entity) {
        return reposetoery.findAll();
    }


    public List<Customer> saveCustomerData(MultipartFile file) {
        if (isExcelFile(file)) {
            try (InputStream inputStream = file.getInputStream();
                 Workbook workbook = new XSSFWorkbook(inputStream)) {
                Sheet sheet = workbook.getSheetAt(0);
                List<Customer> dataEntities = new ArrayList<>();
                Set<String> existingNames = new HashSet<>();

                LocalDate currentDate = LocalDate.now();

                for (Row row : sheet) {
                    if (row.getRowNum() == 0) {
                        continue;
                    }
                    String name = getCellValue(row.getCell(1));
                    if (!existingNames.contains(name)) {
                        if (!isNameExists(name)) {
                            Customer dataEntity = new Customer();
                            dataEntity.setImage(getCellValue(row.getCell(0)));
                            dataEntity.setName(name);
                            dataEntity.setCity(getCellValue(row.getCell(2)));
                            dataEntity.setMobile(getCellValue(row.getCell(3)));
                            dataEntity.setCreationdate(currentDate); // Set current date
                            dataEntity.setUpdateddate(currentDate);
                            dataEntities.add(dataEntity);
                            existingNames.add(name);
                        } else {
                            throw new IllegalArgumentException("Duplicate entry found for name: " + name);
                        }
                    }
                }

                try {
                	reposetoery.saveAll(dataEntities);
                    return reposetoery.findByCreationdate(currentDate); // Return the list of successfully uploaded customers with the current date
                } catch (DataAccessException e) {
                    throw new RuntimeException("Failed to save data to the database", e);
                }

            } catch (IOException e) {
                throw new IllegalArgumentException("Failed to parse Excel file", e);
            }
        } else {
            throw new IllegalArgumentException("The file is not a valid Excel file");
        }
    }
    
    public boolean updateCustomer(Long id,  String name, String city, String mobile, LocalDate updateddate) {
        try {
            Customer customer = reposetoery.findById(id).orElseThrow(() -> new RuntimeException("Customer not found"));
            
            customer.setName(name);
            customer.setCity(city);
            customer.setMobile(mobile);
            customer.setUpdateddate(updateddate);
            reposetoery.save(customer);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
   
    
    public long getCustomersByDate(LocalDate date) {
       long customers = reposetoery.countByCreationdate(date);
        if (customers==0) {
            LocalDate defaultDate = LocalDate.of(2000, 1, 1); // Replace with your desired default date
            customers = reposetoery.countByCreationdate(defaultDate);
        }
        return customers;
    }

    
   //this is for check user will insert excel file

    private boolean isExcelFile(MultipartFile file) {
        String contentType = file.getContentType();
        return contentType != null &&
               (contentType.equals("application/vnd.ms-excel") ||
                contentType.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
    }
     //this is for check table cell type to insert data

    private String getCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                return String.valueOf((long) cell.getNumericCellValue());
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                return cell.getCellFormula();
            default:
                return "";
        }
    }
// To check the data will get present or not in database
    private boolean isNameExists(String name) {
        return reposetoery.existsByName(name);
    }
}
