package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Medicamento;
import com.empresa.repository.MedicamentoRepository;

@Service
public class MedicamentoImpl implements MedicamentoService{
	
	@Autowired
	private MedicamentoRepository repository;
	@Override
	public Medicamento insertaMedicamento(Medicamento obj) {
		return repository.save(obj);
	}
	@Override
	public List<Medicamento> listaPorNombre(String nombre) {
		return repository.findByNombreLike(nombre);
	}

}
