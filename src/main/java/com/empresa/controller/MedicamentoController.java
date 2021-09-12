package com.empresa.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Medicamento;
import com.empresa.service.MedicamentoService;

@Controller
public class MedicamentoController {
	
	@Autowired
	private MedicamentoService service;

	@RequestMapping("/verMedicamento")
	public String ver() {
		return "registraMedicamento";	
		}
	
	@RequestMapping("/registraMedicamento")
	@ResponseBody
	public HashMap<String, String> registra(Medicamento obj){
		HashMap<String, String> salida = new HashMap<String, String>();
		Medicamento objSalida =  service.insertaMedicamento(obj);
		if (objSalida == null) {
			salida.put("mensaje", "Error al registrar");
		}else {
			salida.put("mensaje", "Registro exitoso");
		}
		return salida;
	}
	
	@RequestMapping("/verConsultaMedicamentoPorNombre")
	public String verConsultaPorNombre() {
		return "consultaMedicamentoPorNombre";
	}
	
	@RequestMapping("consultaPorNombre")
	@ResponseBody
	public List<Medicamento> porNombre(String nombre){
		return service.listaPorNombre("%"+ nombre + "%");
	}
	
}
