package com.nt.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nt.Entity.Customer;

@Service
public class Datauploadservice {
	public static boolean checkExcelFormat(MultipartFile file) {
		return Objects.equals(file.getContentType(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	}
	//converting excel data to the list
		public static List<Customer> getCustomerData(InputStream stream)  {
			List<Customer> list=new ArrayList<Customer>();
			
			try {
				XSSFWorkbook workbook= new XSSFWorkbook(stream);
				XSSFSheet sheet=workbook.getSheet("customers");
				
				int rowId=0;
				for(org.apache.poi.ss.usermodel.Row row:sheet) {
					if(rowId==0) {
						rowId++;
						continue;
					}
					Iterator<org.apache.poi.ss.usermodel.Cell> cellIterator=row.iterator();
					 int cellIndex=0;
					 Customer data=new Customer();
					 while(cellIterator.hasNext()) {
						 Cell cell=cellIterator.next();
						 switch (cellIndex) {
						case 0:data.setId((long) cell.getNumericCellValue());
						case 1:data.setImage(cell.getStringCellValue());
						case 2:data.setName(cell.getStringCellValue());
						case 3:data.setCity(cell.getStringCellValue());
						case 4:data.setMobile(cell.getStringCellValue());

						default:
							break;
						}
						 cellIndex++;
					 }
					 list.add(data);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return list;
			
			
		}
		
		
}
