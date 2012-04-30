package com.idquantique.quantis;
import java.text.DecimalFormat

class MainController {

    def index(){
        request.title="QRandom | Home";
    }
    def tutorials(){
        request.title="QRandom | Tutorials";
    }
    def statistics(){
        request.title="QRandom | Statistics";
    }
    def app() {
        request.title = "QRandom - Quantum True-Random Number Generator";
        request.result = "";
        if(params.size()<=2) // no other parameters except for controllers
        return;
        if(!params.containsKey("type")){
            request.result = "error: The data type to generate is not provided";
            return;
        }
        if(!params.containsKey("size")){
            request.result += "error: The amount of data to read is not provided/valid. Cannot be larger than 5242880 bytes.\n";
            return;
        }

        Resource resource = Resource.getInstance();
        if(!resource.acquire()){
            render("error: Quantis device is busy handling many requests right now. Please try in a little while.");
            return;
        }

        try{
            int size = extractSizeParam(params.size);
            Quantis quantis = getQuantisDevice();
            String type = params.type;
            String format = params.containsKey("format") ? params.format : "csv";
            boolean scale = false; //default scale option
            if(params.containsKey("scale"))
            scale = params.scale=="on" ? true : false;
            String output = params.containsKey("output") ? params.output : "display";
            String separator = format=="csv" ? "," : "\n";
            String data = "";
            File file;
            if(params.type=="binary"){
                file = generateRandomBinary(quantis, size);
                output = "file";
            }
            else if(params.type=="integer"){
                if(scale){
                    int minscale, maxscale;
                    minscale = params.containsKey("minscale") ? Integer.parseInt(params.minscale) : 0;
                    maxscale = params.containsKey("maxscale") ? Integer.parseInt(params.maxscale) : 1000;
                    if(minscale>=maxscale){
                        throw new Exception("error: Request Scale is invalid. maxscale has to be larger than minscale");
                    }
                    data = intArrayToString(quantis.ReadScaledIntBlock(size,minscale,maxscale),separator);
                }
                else{
                    data = intArrayToString(quantis.ReadIntBlock(size),separator);
                }
            }
            else if(params.type=="double"){
                if(scale){
                    double minscale,maxscale;
                    minscale = params.containsKey("minscale") ? Double.parseDouble(params.minscale) : 0;
                    maxscale = params.containsKey("maxscale") ? Double.parseDouble(params.maxscale) : 1;
                    if(minscale>=maxscale){
                        throw new Exception("error: Request Scale is invalid. maxscale has to be larger than minscale");
                    }
                    data = doubleArrayToString(quantis.ReadScaledDoubleBlock(size,minscale,maxscale),separator);
                }
                else{
                    data = doubleArrayToString(quantis.ReadDoubleBlock(size),separator);
                }
            }
            else if(params.type=="float"){
                if(scale){
                    float minscale,maxscale;
                    minscale = params.containsKey("minscale") ? Float.parseFloat(params.minscale) : 0;
                    maxscale = params.containsKey("maxscale") ? Float.parseFloat(params.maxscale) : 1;
                    if(minscale>=maxscale){
                        throw new Exception("error: Request Scale is invalid. maxscale has to be larger than minscale");
                    }
                    data = floatArrayToString(quantis.ReadScaledFloatBlock(size,minscale,maxscale),separator);
                }
                else{
                    data = floatArrayToString(quantis.ReadFloatBlock(size),separator);
                }
            }
            else{
                throw new Exception("error: Invalid data type");
            }

            if(output=="display"){
                render( contentType:'text/plain', text: data);
            }
            else{
                if(type!="binary"){
                    String fname = "QRandom-" + type + "-" + Thread.currentThread().hashCode()+ ".txt";
                    file = new File(fname);
                    PrintStream ps = new PrintStream(file);
                    ps.println(data);
                    ps.close();
                }
                response.setContentType("application/octet-stream");
                response.setHeader("Content-disposition", "attachment;filename=${file.getName()}");
                response.setHeader("Content-Length", "${file.size()}");
                if(params.containsKey("token")){
                    def cookie = new javax.servlet.http.Cookie("fileDownloadToken", params.token);
                    cookie.path = '/';
                    response.addCookie(cookie);
                }
                response.outputStream << file.newInputStream(); // Performing a binary stream copy
                file.delete();
            }
        } catch(Exception e){
            e.printStackTrace();
            render(e.getMessage());
        } finally{
            resource.release();
        }
    }

    def stream(){
        if(params.size()<=2) // no other parameters except for controllers
        return;
        if(!params.containsKey("type")){
            request.result = "error: The data type to generate is not provided";
            return;
        }
        if(!params.containsKey("size")){
            request.result += "error: The amount of data to read is not provided/valid. Cannot be larger than 5242880 bytes.\n";
            return;
        }

        Resource resource = Resource.getInstance();
        if(!resource.acquire()){
            render("error: Quantis device is busy handling many requests right now. Please try in a little while.");
            return;
        }

        try{
            int size = extractSizeParam(params.size);
            Quantis quantis = getQuantisDevice();
            String type = params.type;
            String format = params.containsKey("format") ? params.format : "csv";
            boolean scale = false; //default scale option
            if(params.containsKey("scale"))
            scale = params.scale=="on" ? true : false;
            String separator = format=="csv" ? "," : "\n";
            String data = "";
            if(params.type=="integer"){
                if(scale){
                    int minscale, maxscale;
                    minscale = params.containsKey("minscale") ? Integer.parseInt(params.minscale) : 0;
                    maxscale = params.containsKey("maxscale") ? Integer.parseInt(params.maxscale) : 1000;
                    if(minscale>=maxscale){
                        throw new Exception("error: Request Scale is invalid. maxscale has to be larger than minscale");
                    }
                    data = intArrayToString(quantis.ReadScaledIntBlock(size,minscale,maxscale),separator);
                }
                else{
                    data = intArrayToString(quantis.ReadIntBlock(size),separator);
                }
            }
            else if(params.type=="double"){
                if(scale){
                    double minscale,maxscale;
                    minscale = params.containsKey("minscale") ? Double.parseDouble(params.minscale) : 0;
                    maxscale = params.containsKey("maxscale") ? Double.parseDouble(params.maxscale) : 1;
                    if(minscale>=maxscale){
                        throw new Exception("error: Request Scale is invalid. maxscale has to be larger than minscale");
                    }
                    data = doubleArrayToString(quantis.ReadScaledDoubleBlock(size,minscale,maxscale),separator);
                }
                else{
                    data = doubleArrayToString(quantis.ReadDoubleBlock(size),separator);
                }
            }
            else if(params.type=="float"){
                if(scale){
                    float minscale,maxscale;
                    minscale = params.containsKey("minscale") ? Float.parseFloat(params.minscale) : 0;
                    maxscale = params.containsKey("maxscale") ? Float.parseFloat(params.maxscale) : 1;
                    if(minscale>=maxscale){
                        throw new Exception("error: Request Scale is invalid. maxscale has to be larger than minscale");
                    }
                    data = floatArrayToString(quantis.ReadScaledFloatBlock(size,minscale,maxscale),separator);
                }
                else{
                    data = floatArrayToString(quantis.ReadFloatBlock(size),separator);
                }
            }
            else{
                throw new Exception("error: Invalid data type");
            }
            render( contentType:'text/plain', text: data);
        } catch(Exception e){
            e.printStackTrace();
            render(e.getMessage());
        } finally{
            resource.release();
        }
    }

    private String intArrayToString(int[] block, String separator){
        StringBuffer buffer = new StringBuffer();
        if (block.length > 0) {
            buffer.append(block[0]);
            for (int i=1; i<block.length; i++) {
                buffer.append(separator);
                buffer.append(block[i]);
            }
        }
        return buffer.toString();
    }
    private String doubleArrayToString(double[] block, String separator){
        StringBuffer buffer = new StringBuffer();
        if (block.length > 0) {
            buffer.append(block[0]);
            for (int i=1; i<block.length; i++) {
                buffer.append(separator);
                buffer.append(block[i]);
            }
        }
        return buffer.toString();
    }
    private String floatArrayToString(float[] block, String separator){
        StringBuffer buffer = new StringBuffer();
        if (block.length > 0) {
            buffer.append(block[0]);
            for (int i=1; i<block.length; i++) {
                buffer.append(separator);
                buffer.append(block[i]);
            }
        }
        return buffer.toString();
    }
    private File generateRandomBinary(Quantis quantis, int size){
        String fname = "QRandom-binary-" + Thread.currentThread().hashCode() + ".dat";
        File file = new File(fname);
        FileOutputStream fos = new FileOutputStream(file);
        byte[] dat = quantis.ReadByteBlock(size);
        fos.write(dat);
        fos.close();
        return file;
    }
    private Quantis getQuantisDevice() throws Exception{
        Quantis quantis;
        int countPci, countUsb;
        try{
            countPci = Quantis.Count(Quantis.QuantisDeviceType.QUANTIS_DEVICE_PCI);
            countUsb = Quantis.Count(Quantis.QuantisDeviceType.QUANTIS_DEVICE_USB);

        } catch(Exception e){
            countPci = 0;
            countUsb = 0;
        }
        if (countPci > 0) {
            quantis = Quantis.getInstance(Quantis.QuantisDeviceType.QUANTIS_DEVICE_PCI, 0);
        } else if (countUsb > 0) {
            quantis = Quantis.getInstance(Quantis.QuantisDeviceType.QUANTIS_DEVICE_USB, 0);
        } else {
            throw new Exception("error: No Quants device installed.");
        }
        return quantis;
    }
    private int extractSizeParam(String s) throws Exception{
        if(s.length()>7){
            throw new Exception("error: The amount of data to read is too large. Cannot be larger than 5242880 bytes.\n");
        }
        int size = Integer.parseInt(s);
        if(size>5242880){
            throw new Exception("error: The amount of data to read is too large. Cannot be larger than 5242880 bytes.\n");
        }
        return size;
    }
}
