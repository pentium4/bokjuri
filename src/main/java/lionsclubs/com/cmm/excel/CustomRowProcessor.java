package lionsclubs.com.cmm.excel;

import java.util.Map;

import net.sf.jxls.parser.Cell;
import net.sf.jxls.processor.RowProcessor;
import net.sf.jxls.transformer.Row;

public class CustomRowProcessor implements RowProcessor {

    public void processRow(Row row, Map namedCells) {
    	for (int i = 0; i < row.getCells().size(); i++){
    		Cell cell = (Cell) row.getCells().get(i);
    		
    	}
    }

}
