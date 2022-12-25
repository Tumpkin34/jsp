package com.special.app.vo;

public class AnimalVO {
	private Long animalNumber;
	private String animalName;
	private int animalLife;
	private String animalSpecies;
	private String animalExplain;
	
	public AnimalVO() {;}

	public Long getAnimalNumber() {
		return animalNumber;
	}

	public void setAnimalNumber(Long animalNumber) {
		this.animalNumber = animalNumber;
	}

	public String getAnimalName() {
		return animalName;
	}

	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}

	public int getAnimalLife() {
		return animalLife;
	}

	public void setAnimalLife(int animalLife) {
		this.animalLife = animalLife;
	}

	public String getAnimalSpecies() {
		return animalSpecies;
	}

	public void setAnimalSpecies(String animalSpecies) {
		this.animalSpecies = animalSpecies;
	}

	public String getAnimalExplain() {
		return animalExplain;
	}

	public void setAnimalExplain(String animalExplain) {
		this.animalExplain = animalExplain;
	}

	@Override
	public String toString() {
		return "AnimalVO [animalNumber=" + animalNumber + ", animalName=" + animalName + ", animalLife=" + animalLife
				+ ", animalSpecies=" + animalSpecies + ", animalExplain=" + animalExplain + "]";
	}
}
