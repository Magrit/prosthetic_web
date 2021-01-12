package pl.coderslab.prosthetic_web.patient;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChartLabelsService {

    private final PatientRepository patientRepository;
    private final DentalProsthesisRepository prosthesisRepository;
    private final ChartLabelsRepository chartLabelsRepository;

    public ChartLabelsService(PatientRepository patientRepository, DentalProsthesisRepository prosthesisRepository,
                              ChartLabelsRepository chartLabelsRepository) {
        this.patientRepository = patientRepository;
        this.prosthesisRepository = prosthesisRepository;
        this.chartLabelsRepository = chartLabelsRepository;
    }

    public void createNewLabel(long patientId, ChartLabels chartLabels){
        chartLabels.setPatient(patientRepository.getOne(patientId));
        chartLabelsRepository.save(chartLabels);
    }

    public List<ChartLabels> chartLabelInfo(long patientId, long prosthesisId){
        List<ChartLabels> prosthesisInfo = chartLabelsRepository
                .findAllByPatientAndDentalProsthesis(patientRepository.getOne(patientId),
                        prosthesisRepository.getOne(prosthesisId));
        return prosthesisInfo;
    }

    public List<ChartLabels> patientChart(long patientId){
        return chartLabelsRepository.findAllByPatient(patientRepository.getOne(patientId));
    }

    public void deleteLabel(long id){
        chartLabelsRepository.deleteById(id);
    }

    public void deletePatientLabel(long patientId){
        List<ChartLabels> patientChart = chartLabelsRepository.findAllByPatient(patientRepository.getOne(patientId));
        chartLabelsRepository.deleteAll(patientChart);
    }
}
